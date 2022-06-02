#' Format Maryland simple feature data
#'
#' Convert the coordinate reference system, convert invalid geometry to valid
#' geometry with [sf::st_make_valid], and, optionally, erase water, and clean
#' names with [janitor::clean_names]. [format_md_crash_data] works with a data
#' frame of crash data from [get_md_crash_data]
#'
#' @param data A `sf` object or data frame object ([format_md_crash_data] only) .
#' @param crs Coordinate reference system passed to [sf::st_transform], Default:
#'   3857 or option "mapmaryland.crs" if set. Set crs using
#'   [set_mapmaryland_options].
#' @param erase_water If `TRUE`, use [overedge::st_erase] to erase any geometry intersecting with [md_water]; Default: `FALSE`
#' @param clean_names If `TRUE`, use [janitor::clean_names]; Default: `TRUE`
#' @inheritParams overedge::format_data
#' @return A modified version of the input simple feature data.
#' @rdname format_md_sf
#' @seealso [overedge::format_data]
#' @export
#' @importFrom overedge is_sf is_same_crs st_erase rename_sf_col
#' @importFrom sf st_transform st_is_valid st_make_valid
format_md_sf <- function(data, crs = getOption("mapmaryland.crs", default = 3857), erase_water = FALSE, clean_names = TRUE, sf_col = "geometry") {
  stopifnot(
    overedge::is_sf(data)
  )

  if (clean_names) {
    data <- janitor::clean_names(data)
  }

  if (!overedge::is_same_crs(data, crs)) {
    data <- sf::st_transform(data, crs)
  }

  if (erase_water) {
    data <- overedge::st_erase(data, mapmaryland::md_water)
  }

  if (!sf::st_is_valid(data)) {
    data <- sf::st_make_valid(data)
  }

  data <- overedge::rename_sf_col(data, sf_col = "geometry")

  return(data)
}

#' @name format_md_crash_data
#' @rdname format_md_sf
#' @param data Data frame with Maryland vehicular crash data; typically from `get_md_crash_data`
#' @param drop_code If TRUE, drop all columns that end with "code"
#' @export
format_md_crash_data <- function(data, drop_code = TRUE) {

  overedge:::is_pkg_installed("dplyr")
  overedge:::is_pkg_installed("lubridate")

  data <-
    dplyr::mutate(
      data,
      crash_date = lubridate::ymd(acc_date),
      crash_datetime = lubridate::as_datetime(paste0(acc_date, acc_time)),
      dotw = lubridate::wday(crash_date, label = TRUE),
      weekend = dplyr::if_else(dotw %in% c("Sat", "Sun"), "Y", "N"),
      .before = year
    )

  data <-
    dplyr::rowwise(data)

  data <-
    dplyr::mutate(
      data,
      ped_injury = dplyr::if_else(
        grepl(pattern = "Pedestrian", x = paste(harm_event_desc1, harm_event_desc2)),
        "Y", "N"),
      fatal_injury = dplyr::if_else(
        grepl(pattern = "Fatal", x = report_type, perl = TRUE),
        "Y", "N"),
      .before = "harm_event_desc1"
    )

  data <-
    dplyr::rowwise(data)

  data <-
    dplyr::ungroup(data)

  if (drop_code) {
    data <-
      dplyr::select(data, -dplyr::ends_with("code"))
  }

  return(data)
}
