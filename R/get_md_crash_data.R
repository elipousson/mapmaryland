#' Get and format Maryland crash data
#'
#'  Get crash data using [get_md_open_data()]. [format_md_crash_data] works with
#'  a data frame of crash data from [get_md_crash_data()] when type = "crashes".
#'  [format_md_crashes_person()] formats data when type = "persons".
#'  [format_md_crashes()] calls one or the other depending on the type
#'  parameter.
#'
#' @param location A `sf` or `sfc` object covering the location to return crash
#'   data.
#' @param type Supported options include "crashes" (default), "persons" (or
#'   "crashes_person"), and "vehicles" (or "crashes_vehicle").
#' @param report_no Crash report numbers. Defaults to `NULL`. Optionally used to
#'   filter results if type is "persons" or "vehicles".
#' @param where A query parameter passed to [get_md_open_data()]
#' @param ... Passed to [get_md_open_data()] for [get_md_crash_data()] or passed
#'   to specified formatting functions when used with [format_md_crash_data()].
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   get_md_crash_data(
#'     where = "(year = '2020') AND (quarter = 'Q2')",
#'     name_col = "county_desc",
#'     name = "Cecil"
#'   )
#' }
#' }
#' @export
#' @importFrom rlang list2 exec
#' @importFrom glue glue
get_md_crash_data <- function(
  location = NULL,
  ...,
  report_no = NULL,
  where = NULL,
  type = "crashes"
) {
  type <- match.arg(
    type,
    c("crashes", "crashes_person", "persons", "crashes_vehicle", "vehicles")
  )
  crash_data <- NULL

  if (is.null(report_no) && (type != "crashes")) {
    crash_data <- get_md_open_data(
      location = location,
      ...,
      where = where,
      resource = "maryland_statewide_vehicle_crashes",
      quiet = TRUE
    )

    report_no <- crash_data[["report_no"]]
    location <- NULL
  }

  resource <- switch(
    type,
    "crashes" = "maryland_statewide_vehicle_crashes",
    "crashes_person" = "maryland_statewide_vehicle_crashes_person_details_anonymized",
    "persons" = "maryland_statewide_vehicle_crashes_person_details_anonymized",
    "crashes_vehicle" = "maryland_statewide_vehicle_crashes_vehicle_details",
    "vehicles" = "maryland_statewide_vehicle_crashes_vehicle_details"
  )

  if (!is.null(report_no)) {
    params <- rlang::list2(...)
    rlang::check_installed("dplyr")

    data <- lapply(
      split(report_no, ceiling(seq_along(report_no) / 50)),
      function(report_no_group) {
        report_no_group <- paste0(
          "'",
          paste0(report_no_group, collapse = "','"),
          "'"
        )

        where <- paste0(
          c(where, glue::glue("report_no in({report_no_group})")),
          collapse = " AND "
        )

        rlang::exec(
          get_md_open_data,
          resource = resource,
          where = where,
          quiet = TRUE,
          !!!params
        )
      }
    )

    data <- dplyr::bind_rows(data)

    if (!is.null(crash_data)) {
      data <- dplyr::left_join(data, crash_data)
    }

    return(data)
  }

  get_md_open_data(
    location = location,
    resource = resource,
    where = where,
    ...
  )
}


#' @name format_md_crash_data
#' @rdname get_md_crash_data
#' @param data Data frame with Maryland vehicular crash data; typically from
#'   `get_md_crash_data`
#' @param drop_code If `TRUE` (default), drop all columns that end with "code"
#' @export
#' @importFrom rlang check_installed
format_md_crash_data <- function(
  data,
  type = "crashes",
  drop_code = TRUE,
  ...
) {
  rlang::check_installed("dplyr")
  rlang::check_installed("lubridate")

  type <- match.arg(
    type,
    c("crashes", "crashes_person", "persons", "crashes_vehicle", "vehicles")
  )

  data <- switch(
    type,
    "crashes" = format_md_crashes(data, ...),
    "crashes_person" = format_md_crashes_person(data, ...),
    "persons" = format_md_crashes_person(data, ...)
  )

  if (drop_code) {
    data <- dplyr::select(data, -dplyr::ends_with("code"))
  }

  data
}

#' @name format_md_crashes
#' @rdname get_md_crash_data
#' @export
format_md_crashes <- function(data) {
  rlang::check_installed("dplyr")

  data <- format_md_crash_date(data)

  required_cols <- c("harm_event_desc1", "harm_event_desc2", "report_type")

  if (
    !all(rlang::has_name(
      data,
      required_cols
    ))
  ) {
    cli::cli_warn(
      "One or more required columns {.val required_cols} are missing"
    )
    return(data)
  }

  dplyr::mutate(
    data,
    ped_injury = dplyr::if_else(
      grepl(
        pattern = "Pedestrian",
        x = glue::glue("{harm_event_desc1}{harm_event_desc2}")
      ),
      "Y",
      "N"
    ),
    fatal_injury = dplyr::if_else(
      grepl(pattern = "Fatal", x = report_type, perl = TRUE),
      "Y",
      "N"
    ),
    .before = dplyr::all_of("harm_event_desc1")
  )
}

#' @name format_md_crash_date
#' @rdname get_md_crash_data
#' @param cols Column names to use with [format_md_crash_date()].
#' @export
format_md_crash_date <- function(data, cols = c("acc_date", "acc_time")) {
  if (!rlang::has_name(data, cols[1])) {
    cli::cli_warn(
      "{.arg data} is missing a column named {.val {cols[1]}}."
    )
    return(data)
  }

  rlang::check_installed("dplyr")
  rlang::check_installed("lubridate")

  data <-
    dplyr::mutate(
      data,
      crash_date = lubridate::ymd(acc_date),
      dotw = lubridate::wday(crash_date, label = TRUE),
      weekend = dplyr::if_else(dotw %in% c("Sat", "Sun"), "Y", "N"),
      .before = year
    )

  if (!rlang::has_name(data, cols[2])) {
    cli::cli_warn(
      "{.arg data} is missing a column named {.val {cols[2]}}."
    )
    return(data)
  }

  dplyr::mutate(
    data,
    crash_datetime = lubridate::as_datetime(glue::glue("{acc_date}{acc_time}"))
  )
}


#' @name format_md_crashes
#' @rdname get_md_crash_data
#' @param start_year,end_year Start and end year to use when checking validity
#'   of birth dates.
#' @param na_dates Character vector of invalid dates to replace with a
#'   `NA_character_` value.
#' @export
format_md_crashes_person <- function(
  data,
  start_year = 2022,
  end_year = 2022,
  na_dates = c("1/1/1900", "19000101", "19001111", "19001212", "19200202")
) {
  rlang::check_installed("dplyr")
  rlang::check_installed("lubridate")
  rlang::check_installed("naniar")
  rlang::check_installed("stringr")

  data <-
    naniar::replace_with_na(
      data,
      replace = list(date_of_birth = na_dates)
    )

  dplyr::mutate(
    data,
    acc_date = lubridate::ymd(acc_date),
    date_of_birth = stringr::str_replace_all(date_of_birth, "-", " "),
    date_of_birth = stringr::str_remove(date_of_birth, "[:space:]00:00:00"),
    date_of_birth = dplyr::case_when(
      stringr::str_detect(date_of_birth, "[:alpha:]") ~
        lubridate::dmy(date_of_birth),
      TRUE ~ lubridate::ymd(date_of_birth)
    ),
    date_of_birth = dplyr::if_else(
      date_of_birth > lubridate::ymd(paste0(end_year, "1231")),
      date_of_birth - lubridate::years(100),
      date_of_birth
    ),
    age_at_crash = floor(
      lubridate::int_length(
        lubridate::interval(date_of_birth, acc_date)
      ) /
        31557600
    ),
    age_at_crash = dplyr::if_else(
      age_at_crash > (start_year - 100),
      NA_real_,
      age_at_crash
    )
  )
}
