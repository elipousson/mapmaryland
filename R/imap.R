#' Get data from Maryland iMap
#'
#' Get data from Maryland iMap including Computer Assisted Mass Appraisal
#' (CAMA), parcel data, Maryland Inventory of Historic Properties data, and a
#' variety of water data.
#'
#' @details Options for type parameter:
#'
#' - [get_cama_data]: Default: "core"; options: "bldg" (detailed building
#' characteristics), "core", "land", "subarea" (building subarea).
#' - [get_water_data]: Default: "streams", options: "streams" (Rivers and
#' streams generalized), "streams detailed" (Rivers and streams generalized),
#' "federal watersheds", "8 digit watersheds", "12 digit watersheds", "navigable
#' waterways", "ponds" (Lakes and ponds)
#' - [get_parcel_data]: Default "boundaries", options: "boundaries" (Parcel
#' boundaries), "points" (Parcel points)
#' - [get_mht_data]: Default: "mihp"; options: "mihp" (Maryland Inventory of
#' Historic Properties), "nr" (National Register of Historic Places),
#' "easements" (Preservation Easements held by the Maryland Historical Trust)
#'
#' @param location A `sf`, `sfc`, or `bbox` object (or other object convertible
#'   with [overedge::as_bbox]. Required.
#' @param nm Layer name identifier used to retrieve url from [md_imap_index]
#'   based on the snakecase "nm" column; Default: NULL.
#' @param type Default and supported options vary by function. See details.
#' @param crs Coordinate reference system to return.
#' @param ... Additional parameters passed to [overedge::get_esri_data]
#' @name get_imap_data
#' @export
#' @importFrom overedge get_esri_data rename_sf_col
get_imap_data <- function(location, nm = NULL, crs = 3857, ...) {
  url <- get_imap_url(nm)

  data <-
    overedge::get_esri_data(
      location = location,
      url = url,
      crs = crs,
      ...
    )

  data <- overedge::rename_sf_col(data)

  return(data)
}

#' @name get_cama_data
#' @rdname get_imap_data
#' @export
#' @importFrom overedge get_esri_data
get_cama_data <- function(location, type = "core", crs = 3857, ...) {
  type <- match.arg(type, c("core", "bldg", "land", "subarea"))

  nm <-
    switch(type,
      "core" = "cama_core_map",
      "bldg" = "cama_detailed_building_characteristics_map",
      "land" = "cama_land_map",
      "subarea" = "cama_building_subarea_map"
    )

  get_imap_data(
    location = location,
    nm = nm,
    crs = crs,
    ...
  )
}

#' @name get_parcel_data
#' @rdname get_imap_data
#' @export
#' @importFrom overedge get_esri_data
get_parcel_data <- function(location, type = "boundaries", crs = 3857, ...) {
  type <- match.arg(type, c("boundaries", "points"))

  nm <-
    switch(type,
      "boundaries" = "parcel_boundaries_map",
      "points" = "parcel_points_map"
    )

  get_imap_data(
    location = location,
    nm = nm,
    crs = crs,
    ...
  )
}

#' @name get_mht_data
#' @rdname get_imap_data
#' @export
get_mht_data <- function(location, type = "mihp", crs = 3857, ...) {
  type <- match.arg(type, c("mihp", "nr", "easements"))

  nm <-
    switch(type,
      "mihp" = "maryland_inventory_of_historic_properties",
      "nr" = "national_register_historic_places",
      "easements" = "preservation_easements"
    )

  get_imap_data(
    location = location,
    nm = nm,
    crs = crs,
    ...
  )
}

#' @name get_water_data
#' @rdname get_imap_data
#' @export
get_water_data <- function(location, type = "streams", crs = 3857, ...) {
  type <- match.arg(type, c("streams", "streams detailed", "federal watersheds", "8 digit watersheds", "12 digit watersheds", "navigable waterways", "ponds"))
  nm <-
    switch(type,
      "streams detailed" = "rivers_and_streams_detailed",
      "streams" = "rivers_and_streams_generalized",
      "federal watersheds" = "federal_watersheds_huc_11",
      "8 digit watersheds" = "x8_digit_watersheds",
      "12 digit watersheds" = "x12_digit_watersheds",
      "navigable waterways" = "navigable_waterways",
      "ponds" = "large_rivers_lakes_and_ponds"
    )

  get_imap_data(
    location = location,
    nm = nm,
    crs = crs,
    ...
  )
}

#' @noRd
get_imap_url <- function(nm = NULL) {
  md_imap_index[md_imap_index[["nm"]] == nm, ][["url"]]
}
