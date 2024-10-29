#' Use package data or the \{tigris\} package to get Maryland data from the U.S.
#' Census Bureau
#'
#' Get package data with Maryland counties, U.S. Congressional District, or
#' Census designated places by name or GeoID or use the tigris package to
#' download state data.
#'
#' @details Use \{mapmaryland\} packaged data or use tigris U.S. Census Bureau
#'   API:
#'
#'   Supported options that access data included with the \{mapmaryland\} package
#'   include "counties", "census places", "congressional districts",
#'   "legislative districts", and "water".
#'
#'   Options that access data by calling one of several tigris functions for
#'   downloading data from the U.S. Census Bureau API include "senate district",
#'   "tracts", "block groups", "blocks", "pumas", "voting districts", "zctas",
#'   "roads", "primary secondary roads", "area water",  "linear water", and
#'   "landmarks".
#'
#'   tigris functions that do not use a "state" parameter (e.g.
#'   [tigris::coastline] or [tigris::rails])  are not supported by this
#'   function.
#'
#' @param name Name matching a value in the namelsad, namelsad, or geoid columns
#'   of [md_counties], [md_census_places], [md_congressional_districts], or one
#'   of the data sets available for download with \{tigris\}; Default: `NULL`
#' @param type Type of data to return, Default: "counties"; See details for
#'   supported options.
#' @inheritParams format_md_sf
#' @param ... Additional parameters passed on to \{tigris\} functions.
#' @return A simple feature object matching the type provided.
#' @rdname get_md_tigris
#' @export
#' @importFrom janitor clean_names
get_md_tigris <- function(name = NULL,
                          type = "counties",
                          crs = getOption("mapmaryland.crs", default = 3857),
                          erase_water = FALSE,
                          ...) {
  check_installed("tigris")
  pkg_data <- c("counties", "census places", "congressional districts", "water")

  api_data <- c(
    "legislative districts", "senate district", "voting districts",
    "tracts", "block groups", "blocks", "pumas", "zctas",
    "roads", "primary secondary roads", "area water", "linear water", "landmarks"
  )

  type <- match.arg(
    tolower(type),
    c("county", pkg_data, api_data)
  )

  state <- "MD"

  data <- switch(type,
    "county" = mapmaryland::md_counties,
    "counties" = mapmaryland::md_counties,
    "census places" = mapmaryland::md_census_places,
    "congressional districts" = mapmaryland::md_congressional_districts,
    "water" = mapmaryland::md_water,
    "legislative districts" = tigris::state_legislative_districts(state = state, house = "lower", ...),
    "senate districts" = tigris::state_legislative_districts(state = state, house = "upper", ...),
    "county subdivisions" = tigris::county_subdivisions(state = state, ...),
    "block groups" = tigris::block_groups(state = state, ...),
    "blocks" = tigris::blocks(state = state, ...),
    "pumas" = tigris::pumas(state = state, ...),
    "voting districts" = tigris::voting_districts(state = state, ...),
    "roads" = tigris::roads(state = state, ...),
    "primary secondary roads" = tigris::primary_secondary_roads(state = state, ...),
    "area water" = tigris::area_water(state = state, ...),
    "linear water" = tigris::linear_water(state = state, ...),
    "landmarks" = tigris::landmarks(state = state, ...),
    "zctas" = tigris::zctas(state = state, ...)
  )

  if (type %in% api_data) {
    data <- janitor::clean_names(data)
  }

  if (!is.null(name)) {
    data <- data[lookup_tigris_name(name, data), ]
  }

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
