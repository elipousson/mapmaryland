#' Create an index of folders, services, layers, and tables for an ArcGIS Server
#' @noRd
#' @importFrom dplyr bind_cols bind_rows mutate if_else case_when
#' @importFrom purrr map2_dfr
esriIndex <- function(url, parent = NULL, recurse = FALSE, ...) {
  esriResp <- esriCatalog(url, ...)

  index <- NULL
  urlIndex <- url

  if (!!length(esriResp[["folders"]])) {
    folders <-
      dplyr::bind_cols(
        "name" = unlist(esriResp$folders),
        "index" = "folder",
        "type" = NA
      )

    index <-
      dplyr::bind_rows(
        index,
        folders
      )
  }

  if (!!length(esriResp[["services"]])) {
    services <-
      dplyr::bind_rows(esriResp$services)

    services <-
      dplyr::bind_cols(
        services,
        "index" = "service"
      )

    index <-
      dplyr::bind_rows(
        index,
        services
      )
  }

  if (is.null(index)) {
    return(index)
  }

  urlbase <-
    regmatches(
      urlIndex,
      regexpr(pattern = ".+(?=/)", text = urlIndex, perl = TRUE)
    )

  index <-
    dplyr::mutate(
      index,
      url = NULL,
      url = dplyr::if_else(
        grepl(pattern = "/", x = name),
        urlbase,
        urlIndex
      ),
      url = dplyr::case_when(
        (index == "folder") ~ paste0(url, "/", name),
        TRUE ~ paste0(url, "/", name, "/", type)
      )
    )

  if (!is.null(parent)) {
    index <-
      dplyr::bind_cols(
        index,
        "parent" = parent
      )
  }

  if (recurse) {
    folderIndex <- subset(index, index == "folder")

    if (nrow(folderIndex) > 0) {
      folderIndex <-
        purrr::map2_dfr(
          folderIndex$url,
          folderIndex$name,
          ~ esriIndex(url = .x, parent = .y, recurse = TRUE)
        )

      index <-
        dplyr::bind_rows(
          index,
          folderIndex
        )
    }

    layerIndex <- subset(index, type %in% c("MapServer", "FeatureServer", "ImageServer", "GeocodeServer", "GeometryServer", "GPServer"))

    if (nrow(layerIndex) > 0) {
      layerIndex <-
        purrr::map2_dfr(
          layerIndex$url,
          layerIndex$name,
          ~ esriLayers(url = .x, parent = .y)
        )

      index <-
        dplyr::bind_rows(
          index,
          layerIndex
        )
    }
  }

  return(index)
}

#' Create an index of layers and tables from an ArcGIS Service
#' @noRd
#' @importFrom dplyr bind_cols bind_rows
esriLayers <- function(url, parent = NULL, ...) {
  esriResp <- esriCatalog(url, ...)

  index <- NULL

  if (!!length(esriResp[["layers"]])) {
    layers <-
      dplyr::bind_cols(
        dplyr::bind_rows(esriResp$layers),
        "index" = "layer"
      )

    index <-
      dplyr::bind_rows(
        index,
        layers
      )
  }

  if (!!length(esriResp[["tables"]])) {
    tables <-
      dplyr::bind_cols(
        dplyr::bind_rows(esriResp$tables),
        "index" = "table"
      )

    index <-
      dplyr::bind_rows(
        index,
        tables
      )
  }

  if (is.null(index)) {
    return(index)
  }

  index <-
    dplyr::bind_cols(
      index,
      "parent" = parent,
      "url" = paste0(url, "/", index$id)
    )

  return(index)
}


#' Get a catalog of folders, services, tables, and layers
#' @noRd
#' @importFrom httr2 request req_url_query req_perform resp_body_json resp_body_xml
#' @importFrom xml2 as_list
#' @importFrom dplyr bind_rows
esriCatalog <- function(url, format = "json", token = "", option = NULL, outSR = NULL, ...) {
  format <- match.arg(format, c("json", "html", "kmz", "sitemap", "geositemap"))
  req <- httr2::request(url)
  req <- httr2::req_url_query(req = req, f = format, token = token)

  resp <- httr2::req_perform(req = req)

  if (format == "json") {

    if (!is.null(option) && (option == "footprints")) {

      req <- httr2::req_url_query(req = req, option = option)

      if (!is.null(outSR)) {
        req <- httr2::req_url_query(req = req, outSR = outSR)
      }
    }

    json <- httr2::resp_body_json(resp = resp, check_type = FALSE, ...)

    return(json)
  } else if (format %in% c("sitemap", "geositemap")) {
    sitemap <- httr2::resp_body_xml(resp, ...)

    sitemap <- xml2::as_list(sitemap)

    sitemap <- dplyr::bind_rows("url" = unlist(sitemap, use.names = FALSE))

    return(sitemap)
  }
}
