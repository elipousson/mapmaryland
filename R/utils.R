utils::globalVariables(
  c(
    "md_arcgis_index",
    "md_counties",
    "md_imap_index",
    "md_open_data_index",
    "type_nm_index"
  ),
  package = "mapmaryland"
)

#' Get nm from type
#'
#' @noRd
type2nm <- function(type, index = NULL) {
  type <-
    match.arg(type, names(type_nm_index[[index]]))

  get_index_var(
    nm = type,
    index = type_nm_index[[index]]
  )
}

#' Get index variable from a data frame or list
#'
#' @noRd
get_index_var <- function(nm = NULL, index = NULL, var = NULL, id = "nm") {
  if (grepl(pattern = " ", x = nm)) {
    nm <- janitor::make_clean_names(nm)
  }

  if (is.data.frame(index)) {
    return(index[index[[id]] == nm, ][[var]])
  }

  if (is.list(index)) {
    index <- index[[nm]]

    if (!is.null(var)) {
      return(index[[var]])
    }

    return(index)
  }
}


#' Set options for mapmaryland package
#'
#' Currently only used for mapmaryland.crs
#'
#' @param ... options to set, e.g. "crs = 2804" to set "mapmaryland.crs" to 2804.
#' @param overwrite If `TRUE`, overwrite any existing option value.
#' @export
#' @importFrom rlang list2
#' @importFrom cli cli_alert_success cli_warn
set_mapmaryland_option <- function(..., overwrite = TRUE) {
  option <- rlang::list2(...)

  nm_option <- paste0("mapmaryland.", names(option))
  existing_option <- getOption(nm_option)

  if (is.null(existing_option) | overwrite) {
    options(nm_option = option)
    cli::cli_alert_success(
      "{.var {nm_option}} set to {.val {as.character(option)}}."
    )
  } else if (!overwrite) {
    cli::cli_warn(
      "The option {.var {nm_option}} is {.val {existing_option}}.
    Set {.arg overwrite} to {.val TRUE} to replace with {.val {as.character(option)}}."
    )
  }
}
