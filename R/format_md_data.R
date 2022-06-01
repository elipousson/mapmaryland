#' Format Maryland simple feature data
#'
#' Convert the coordinate reference system, convert invalid geometry to valid
#' geometry with [sf::st_make_valid], and, optionally, erase water, and clean
#' names with [janitor::clean_names].
#'
#' @param data A `sf` object.
#' @param crs Coordinate reference system passed to [sf::st_transform], Default: 3857
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
