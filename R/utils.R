.onLoad <- function(libname, pkgname) {
  utils::data(
    list = c(
      "md_counties", "md_census_places", "md_congressional_districts", "md_water",
      "md_arcgis_index", "md_imap_index", "md_open_data_index"
    ),
    package = pkgname,
    envir = parent.env(environment())
  )
}

utils::globalVariables(
  c( # Variables for format_md_crash_data
    "acc_date", "acc_time", "crash_date", "dotw",
    "harm_event_desc1", "harm_event_desc2", "report_type", "year"
  )
)

#' Get nm from type
#'
#' @noRd
type2nm <- function(type = NULL, index = NULL, null.ok = TRUE) {
  if (is.null(type) & !null.ok) {
    stop("type is NULL and null.ok is FALSE.")
  }

  type <-
    match.arg(type, names(type_nm_index[[index]]))

  get_index_var(
    nm = type,
    index = type_nm_index[[index]]
  )
}

#' Get index variable from a data frame or list
#'
#' @noRd
get_index_var <- function(nm = NULL, index = NULL, var = NULL, id = "nm") {
  if (grepl(pattern = " ", x = nm)) {
    nm <- janitor::make_clean_names(nm)
  }

  if (is.data.frame(index)) {
    return(index[index[[id]] == nm, ][[var]])
  }

  if (is.list(index)) {
    index <- index[[nm]]

    if (!is.null(var)) {
      return(index[[var]])
    }

    return(index)
  }
}


#' Set options for mapmaryland package
#'
#' Currently only used for mapmaryland.crs
#'
#' @param crs Coordinate reference system to set, e.g. "crs = 2804" to set "mapmaryland.crs" to 2804.
#' @param overwrite If `TRUE`, overwrite any existing option value.
#' @export
#' @importFrom cli cli_alert_success cli_warn
set_mapmaryland_options <- function(crs = NULL, overwrite = TRUE) {
  pkg <- "mapmaryland"

  option <-
    list(
      "crs" = crs
    )

  option_nm <- paste0(pkg, ".", names(option))
  existing_option <- getOption(option_nm)

  if (is.null(existing_option) | overwrite) {
    cli::cli_alert_success(
      "{.var {option_nm}} set to {.val {as.character(option)}}."
    )
    options(option)
  } else if (!overwrite) {
    cli::cli_warn(
      "The option {.var {option_nm}} is already set to {.val {existing_option}}.
    Set {.arg overwrite} to {.val TRUE} to replace with {.val {as.character(option)}}."
    )
  }
}
