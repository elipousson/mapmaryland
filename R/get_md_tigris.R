#' Use package data or the {tigris} package to get Maryland data from the U.S. Census Bureau
#'
#' Get package data with Maryland counties, U.S. Congressional District, or Census designated
#' places by name or GeoID or use the tigris package to download state data.
#'
#' @details Use {mapmaryland} packaged data or use tigris U.S. Census Bureau API:
#'
#' Supported options that access data included with the {mapmaryland} package
#' include "counties", "census places", "congressional districts", "legislative
#' districts", and "water".
#'
#' Options that access data by calling one of several tigris functions for
#' downloading data from the U.S. Census Bureau API include "senate district",
#' "tracts", "block groups", "blocks", "pumas", "voting districts". tigris
#' functions that do not use a "state" parameter (e.g. [tigris::zctas])  are not
#' supported by this function.
#'
#' @param name Name matching a value in the namelsad, namelsad, or geoid columns
#'   of [md_counties], [md_census_places], [md_congressional_districts],
#'   [md_legislative_districts], or [md_senate_districts],
#'   Default: NULL
#' @param type Type of data to return, Default: "counties"; See details for supported options.
#' @param ... Additional parameters passed on to {tigris} functions.
#' @return A simple feature object matching the type provided.
#' @rdname get_md_tigris
#' @export
#' @importFrom tigris state_legislative_districts county_subdivisions block_groups blocks pumas voting_districts
#' @importFrom janitor clean_names
#' @importFrom overedge is_same_crs st_erase
#' @importFrom sf st_transform
get_md_tigris <- function(name = NULL, type = "counties", crs = getOption("mapmaryland.crs", default = 3857), erase_water = FALSE, ...) {
  pkg_data <- c("counties", "census places", "congressional districts", "legislative districts", "water")
  api_data <- c("senate district", "tracts", "block groups", "blocks", "pumas", "voting districts")

  type <-
    match.arg(
      tolower(type),
      c("county", pkg_data, api_data)
    )

  state <- "MD"

  data <-
    switch(type,
      "county" = mapmaryland::md_counties,
      "counties" = mapmaryland::md_counties,
      "census places" = mapmaryland::md_census_places,
      "congressional districts" = mapmaryland::md_congressional_districts,
      "legislative districts" = mapmaryland::md_legislative_districts,
      "water" = mapmaryland::md_water,
      "senate districts" = tigris::state_legislative_districts(state = state, house = "upper", ...),
      "county subdivisions" = tigris::county_subdivisions(state = state, ...),
      "block groups" = tigris::block_groups(state = state, ...),
      "blocks" = tigris::blocks(state = state, ...),
      "pumas" = tigris::pumas(state = state, ...),
      "voting districts" = tigris::voting_districts(state = state, ...)
    )

  if (type %in% api_data) {
    data <- janitor::clean_names(data)
  }

  data <- data[lookup_tigris_name(name, data), ]

  data <- format_md_sf(data, crs = crs, erase_water = erase_water, clean_names = FALSE)

  return(data)
}

#' @noRd
lookup_tigris_name <- function(name, data = NULL) {

  name <-
    tolower(name)

  lookup <-
    ((tolower(data[["name"]]) %in% name) | (tolower(data[["namelsad"]]) %in% name) | (data[["geoid"]] %in% name))

  return(lookup)
}
