#' Format Maryland simple feature data
#'
#' Convert the coordinate reference system, convert invalid geometry to valid
#' geometry with [sf::st_make_valid()], and, optionally, erase water, and clean
#' names with [janitor::clean_names()].
#'
#' @param data A `sf` object or for ([format_md_crash_data()] only) a data.frame
#'   object.
#' @param crs coordinate reference system. Defaults to
#'   `getOption("mapmaryland.crs", default = 3857)`. This option can be set with
#'   [set_mapmaryland_options()].
#' @param erase_water If `TRUE`, erase any geometry intersecting with
#'   [md_water]; Default: `FALSE`. If `TRUE`, and erase_data is not `NULL`, [md_water]
#'   is combined and unioned with erase_data.
#' @inheritParams getdata::format_sf_data
#' @inheritParams getdata::format_data
#' @return A modified version of the input simple feature data.
#' @rdname format_md_sf
#' @seealso [getdata::format_sf_data]
#' @export
#' @importFrom sfext st_filter_ext check_sf
#' @importFrom sf st_union st_combine
#' @importFrom getdata format_sf_data
format_md_sf <- function(data,
                         crs = getOption("mapmaryland.crs", default = 3857),
                         erase_water = FALSE,
                         erase_data = NULL,
                         clean_names = TRUE,
                         dTolerance = NULL,
                         smooth = FALSE,
                         sf_col = "geometry",
                         ...) {
  if (erase_water) {
    water <- sfext::st_filter_ext(md_water, data)

    if (is.null(erase_data)) {
      erase_data <- water
    } else {
      sfext::check_sf(erase_data)

      erase_data <- sf::st_union(sf::st_combine(erase_data, water))
    }
  }

  getdata::format_sf_data(
    data,
    crs = crs,
    erase_data = erase_data,
    clean_names = clean_names,
    dTolerance = dTolerance,
    smooth = smooth,
    sf_col = sf_col,
    ...
  )
}
