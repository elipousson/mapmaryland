#' Get data from the Maryland Open Data Portal
#'
#' Wrap [getdata::get_open_data] to access the Maryland Open Data portal. The
#' source url can be set with an option named "mapmaryland.open_data_source_url"
#' but it defaults to the statewide open data portal
#' <https://opendata.maryland.gov> The token type can be set with an option
#' named "mapmaryland.open_data_token_type" but it defaults to
#' "MARYLAND_OPEN_DATA_API_KEY".
#'
#' @param resource Resource identifier code passed to "data" parameter of
#'   [getdata::get_open_data]
#' @param type Type of data to return. Supported options: "crashes", "road
#'   closures", "bay pollution reduction"
#' @param token Optional access token or API Key to pass to
#'   [getdata::set_access_token()]. The token type variable is set by
#'   `getOption("mapmaryland.open_data_token_type", default =
#'   "MARYLAND_OPEN_DATA_API_KEY")`
#' @inheritParams getdata::get_open_data
#' @inheritDotParams getdata::get_open_data
#' @export
#' @importFrom getdata get_access_token get_open_data
get_md_open_data <- function(
  resource = NULL,
  type = NULL,
  crs = getOption("mapmaryland.crs", default = 3857),
  geometry = FALSE,
  token = NULL,
  ...
) {
  if (!is.null(type) && is.null(resource)) {
    resource <-
      type2nm(type, index = "md_open_data")
  }

  if (grepl(pattern = "_", x = resource)) {
    resource <-
      get_md_open_data_resource(
        nm = resource
      )
  }

  token_type <-
    getOption(
      "mapmaryland.open_data_token_type",
      default = "MARYLAND_OPEN_DATA_API_KEY"
    )

  source_url <-
    getOption(
      "mapmaryland.open_data_source_url",
      default = "https://opendata.maryland.gov"
    )

  getdata::get_open_data(
    data = resource,
    source_url = source_url,
    geometry = geometry,
    crs = crs,
    token = token,
    type = token_type,
    ...
  )
}

#' Get URL from Maryland Open Data Index
#'
#' @noRd
get_md_open_data_resource <- function(nm = NULL) {
  get_index_var(nm = nm, index = md_open_data_index, var = "resource")
}
