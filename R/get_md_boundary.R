#' Get Maryland administrative boundaries
#'
#' Get Maryland counties, U.S. Congressional District, or Census designated
#' places by name or GeoID.
#'
#' @param name Name matching a value in the namelsad, namelsad, or geoid columns
#'   of [md_counties], [md_census_places], [md_congressional_districts],
#'   [md_legislative_districts], or [md_senate_districts],
#'   Default: NULL
#' @param type Type, "county", "census place", "congressional district",
#'   "legislative district", or "senate district";
#'   Default: 'county'
#' @return A simple feature object matching the type provided.
#' @rdname get_md_boundary
#' @export
get_md_boundary <- function(name = NULL, type = "county") {
  type <-
    match.arg(
      tolower(type),
      c("county", "census place", "congressional district", "legislative district", "senate district")
    )
  type <-
    switch(type,
           "county" = mapmaryland::md_counties,
           "census place" = mapmaryland::md_census_places,
           "congressional district" = mapmaryland::md_congressional_districts,
           "legislative district" = mapmaryland::md_legislative_districts,
           "senate district" = mapmaryland::md_senate_districts
    )

  type[(type[["name"]] %in% name) | (type[["namelsad"]] %in% name) | (type[["geoid"]] %in% name), ]
}
