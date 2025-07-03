#' Cache data from Maryland iMap
#'
#' [cache_imap_data()] is a wrapper for [get_imap_data()] and
#' [getdata::cache_location_data()] that save a layer from Maryland iMap or a
#' subset of a layer to a local file. By default, the data is saved to the
#' mapmaryland package cache folder.
#'
#' @inheritParams get_imap_data
#' @inheritParams getdata::cache_location_data
#' @export
#' @importFrom getdata cache_location_data
#' @importFrom rlang caller_env %||%
cache_imap_data <- function(
  data = NULL,
  nm = NULL,
  ...,
  location = NULL,
  name = NULL,
  label = NULL,
  fileext = "gpkg",
  filename = NULL,
  path = NULL,
  prefix = NULL,
  postfix = NULL,
  cache = TRUE,
  pkg = "getdata",
  create = TRUE,
  overwrite = FALSE,
  call = caller_env()
) {
  data <- data %||%
    get_imap_data(
      location = location,
      nm = nm,
      ...
    )

  getdata::cache_location_data(
    data = data,
    filename = filename,
    pkg = "mapmaryland",
    location = location,
    name = name,
    label = label,
    fileext = fileext,
    filename = filename,
    path = path,
    prefix = prefix,
    postfix = postfix,
    cache = cache,
    pkg = "mapmaryland",
    create = create,
    overwrite = overwrite,
    call = call
  )
}
