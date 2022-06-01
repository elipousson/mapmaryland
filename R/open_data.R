#' Get data from the Maryland Open Data Portal
#'
#' @param type Type of data to return. Supported options: "crashes", "road closures", "bay pollution reduction"
#' @inheritParams overedge::get_open_data
#' @export
#' @importFrom overedge get_access_token get_open_data
get_md_open_data <- function(resource = NULL,
                             type = NULL,
                             crs = getOption("mapmaryland.crs", default = 3857),
                             geometry = FALSE,
                             token = NULL,
                             ...) {
  if (!is.null(type) & is.null(resource)) {
    resource <-
      type_2_nm[[type]]
  }

  if (grepl(pattern = "_", x = resource)) {
    resource <-
      get_md_open_data_resource(
        nm = resource
      )
  }

  token_type <- "MARYLAND_OPEN_DATA_API_KEY"

  token <- overedge::get_access_token(token = token, type = token_type)

  source_url <- "https://opendata.maryland.gov"

  overedge::get_open_data(
    data = resource,
    source_url = source_url,
    geometry = geometry,
    crs = crs,
    token = token,
    ...
  )
}

#' @rdname get_md_open_data
#' @name get_md_crash_data
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   get_md_crash_data(
#'     where = "(year = '2020') AND (quarter = 'Q2')",
#'     name_col = "county_desc",
#'     name = "Cecil"
#'   )
#' }
#' }
#' @export
get_md_crash_data <- function(...) {
  get_md_open_data(resource = "maryland_statewide_vehicle_crashes", ...)
}

#' Get URL from Maryland Open Data Index
#'
#' @noRd
get_md_open_data_resource <- function(nm = NULL) {
  get_index_var(nm = nm, index = md_open_data_index, var = "resource")
}
