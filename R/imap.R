#' Get data from Maryland iMap
#'
#' Get Computer Assisted Mass Appraisal (CAMA) and parcel data.
#'
#' @param location A `sf`, `sfc`, or `bbox` object (or other object convertible with [overedge::as_bbox]. Required.
#' @param type For [get_cama_data], type of data to return, Default: 'bldg'; options include "bldg", "core", "land", "subarea".
#' @param ... Additional parameters passed to [overedge::get_esri_data]
#' @name get_imap_data
get_imap_data <- function(location, nm = NULL, ...) {
  url <- get_imap_url(nm)

  overedge::get_esri_data(
    location = location,
    url = url,
    ...
  )
}


#' @name get_cama_data
#' @rdname get_imap_data
#' @export
#' @importFrom overedge get_esri_data
get_cama_data <- function(location, type = "bldg", ...) {
  type <- match.arg(type, c("bldg", "core", "land", "subarea"))

  url <-
    switch(type,
      "bldg" = get_imap_url("cama_detailed_building_characteristics"),
      "core" = get_imap_url("cama_core"),
      "land" = get_imap_url("cama_land"),
      "subarea" = get_imap_url("cama_building_subarea")
    )

  overedge::get_esri_data(
    location = location,
    url = url,
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
#' @importFrom overedge get_esri_data
get_mihp_data <- function(location, ...) {
  get_imap_data(
    location = location,
    nm = "maryland_inventory_of_historic_properties",
    ...
  )
}

#' @noRd
get_imap_url <- function(nm = NULL) {
  md_imap_index[md_imap_index[["nm"]] == nm,][["url"]]
}
