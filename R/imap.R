#' Get data from Maryland iMap
#'
#' Get data from Maryland iMap including Computer Assisted Mass Appraisal
#' (CAMA), parcel data, Maryland Inventory of Historic Properties data, and a
#' variety of water data.
#'
#' @details Options for type parameter:
#'
#' - [get_cama_data()]: Default: "core"; options: "bldg" (detailed building
#' characteristics), "core", "land", "subarea" (building subarea).
#' - [get_water_data()]: Default: "streams", options: "streams" (Rivers and
#' streams generalized), "streams detailed" (Rivers and streams generalized),
#' "federal watersheds", "8 digit watersheds", "12 digit watersheds", "navigable
#' waterways", "ponds" (Lakes and ponds)
#' - [get_parcel_data()]: Default "boundaries", options: "boundaries" (Parcel
#' boundaries), "points" (Parcel points)
#' - [get_mht_data()]: Default: "mihp"; options: "mihp" (Maryland Inventory of
#' Historic Properties), "nr" (National Register of Historic Places),
#' "easements" (Preservation Easements held by the Maryland Historical Trust)
#'
#' @details Helper functions:
#'
#' - [format_parcel_data()] is a wrapper for [getdata::bind_block_col()] used by
#'  [get_parcel_data()]
#' - [get_imap_url()] is a look-up function for the `md_imap_index` using the
#' short "nm" column as a index.
#'
#' @param location A `sf`, `sfc`, or `bbox` object (or other object convertible
#'   with [sfext::as_bbox()]. Required.
#' @param nm Layer name identifier used to retrieve url from `md_imap_index`
#'   based on the snakecase "nm" column; Default: `NULL`.
#' @param type Default and supported options vary by function. See details.
#' @param crs Coordinate reference system to return. Defaults to
#'   `getOption("mapmaryland.crs", default = 3857)`.
#' @param ... Additional parameters passed to [getdata::get_esri_data()]
#' @name get_imap_data
#' @export
#' @importFrom getdata get_esri_data
#' @importFrom sfext rename_sf_col
get_imap_data <- function(
  location = NULL,
  nm = NULL,
  crs = getOption("mapmaryland.crs", default = 3857),
  ...
) {
  url <- get_imap_url(nm)

  check_installed("arcgislayers")

  data <- getdata::get_esri_data(
    location = location,
    url = url,
    crs = crs,
    ...
  )

  if (!inherits(data, "sf")) {
    return(data)
  }

  sfext::rename_sf_col(data)
}

#' @name get_cama_data
#' @rdname get_imap_data
#' @export
get_cama_data <- function(
  location,
  type = "core",
  crs = getOption("mapmaryland.crs", default = 3857),
  ...
) {
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
#' @param block If block is `TRUE`, pass parcel data to
#'   [getdata::bind_block_col()]. Defaults to `FALSE`.
#' @export
#' @importFrom getdata bind_block_col
get_parcel_data <- function(
  location,
  type = "boundaries",
  crs = getOption("mapmaryland.crs", default = 3857),
  block = FALSE,
  ...
) {
  nm <-
    type2nm(
      type = type,
      index = "imap_parcel"
    )

  data <-
    get_imap_data(
      location = location,
      nm = nm,
      crs = crs,
      ...
    )

  if (
    !block ||
      !all(rlang::has_name(data, c("strtnum", "strtdir", "strtnam", "strttyp")))
  ) {
    return(data)
  }

  format_parcel_data(data)
}

#' @name format_parcel_data
#' @rdname get_imap_data
#' @param data Data to pass to [getdata::bind_block_col()].
#'   [format_parcel_data()] only.
#' @param imap_addr_cols Named list with address column names for input data.
#'   Passed to corresponding parameters in [getdata::bind_block_col()]
#' @export
format_parcel_data <- function(
  data,
  imap_addr_cols = list(
    bldg_num = "strtnum",
    street_dir_prefix = "strtdir",
    street_name = "strtnam",
    street_suffix = "strttyp"
  )
) {
  getdata::bind_block_col(
    data,
    bldg_num = imap_addr_cols$bldg_num,
    street_dir_prefix = imap_addr_cols$street_dir_prefix,
    street_name = imap_addr_cols$street_name,
    street_suffix = imap_addr_cols$street_suffix,
    case = "upper"
  )
}

#' @name get_mht_data
#' @rdname get_imap_data
#' @export
get_mht_data <- function(
  location,
  type = "mihp",
  crs = getOption("mapmaryland.crs", default = 3857),
  ...
) {
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
get_water_data <- function(
  location,
  type = "streams",
  crs = getOption("mapmaryland.crs", default = 3857),
  ...
) {
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

#' @name get_imap_url
#' @rdname get_imap_data
#' @export
get_imap_url <- function(nm = NULL) {
  get_index_var(nm = nm, index = md_imap_index, var = "url")
}
