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
get_imap_data <- function(location = NULL, nm = NULL, crs = getOption("mapmaryland.crs", default = 3857), ...) {
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
get_cama_data <- function(location, type = "core", crs = getOption("mapmaryland.crs", default = 3857), ...) {
  nm <-
    type2nm(
      type = type,
      index = "imap_cama"
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
get_parcel_data <- function(location, type = "boundaries", crs = getOption("mapmaryland.crs", default = 3857), ...) {
  nm <-
    type2nm(
      type = type,
      index = "imap_parcel"
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
get_mht_data <- function(location, type = "mihp", crs = getOption("mapmaryland.crs", default = 3857), ...) {
  nm <-
    type2nm(
      type = type,
      index = "imap_mht"
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
get_water_data <- function(location, type = "streams", crs = getOption("mapmaryland.crs", default = 3857), ...) {
  nm <-
    type2nm(
      type = type,
      index = "imap_water"
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
  get_index_var(nm = nm, index = md_imap_index, var = "url")
}
