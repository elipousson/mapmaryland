#' Get data from Maryland iMap
#'
#' Get data from Maryland iMap including Computer Assisted Mass Appraisal
#' (CAMA), parcel data, Maryland Inventory of Historic Properties data, and a
#' variety of water data.
#'
#' @details Options for type parameter:
#'
#' - For [get_cama_data], Default: 'bldg'; options include "bldg", "core",
#' "land", "subarea".
#' - For [get_water_data], Default: "streams", options include "streams",
#' "streams detailed", "federal watersheds", "8 digit watersheds", "12 digit
#' watersheds", "navigable waterways", "ponds"
#'
#' @param location A `sf`, `sfc`, or `bbox` object (or other object convertible
#'   with [overedge::as_bbox]. Required.
#' @param type See details.
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
get_cama_data <- function(location, type = "bldg", ...) {
  type <- match.arg(type, c("bldg", "core", "land", "subarea"))

  nm <-
    switch(type,
      "bldg" = "cama_detailed_building_characteristics",
      "core" = "cama_core",
      "land" = "cama_land",
      "subarea" = "cama_building_subarea"
    )

  get_imap_data(
    location = location,
    nm = nm,
    ...
  )
}

#' @name get_parcel_data
#' @rdname get_imap_data
#' @export
#' @importFrom overedge get_esri_data
get_parcel_data <- function(location, ...) {
  get_imap_data(
    location = location,
    nm = "parcel_boundaries",
    ...
  )
}

#' @name get_mihp_data
#' @rdname get_imap_data
#' @export
get_mihp_data <- function(location, ...) {
  get_imap_data(
    location = location,
    nm = "maryland_inventory_of_historic_properties",
    ...
  )
}

#' @name get_water_data
#' @rdname get_imap_data
#' @export
get_water_data <- function(location, type = "streams", ...) {
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
    ...
  )
}

#' @noRd
get_imap_url <- function(nm = NULL) {
  md_imap_index[md_imap_index[["nm"]] == nm, ][["url"]]
}
