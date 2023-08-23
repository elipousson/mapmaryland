## code to prepare `md_esri_index` dataset goes here
library(dplyr)

md_arcgis_index <-
  googlesheets4::read_sheet(
    ss = "https://docs.google.com/spreadsheets/d/1c829bZdNqvbpoizulBU_XE5jVeNNck2kHkS-smpQ52s/edit?usp=sharing",
    sheet = "services"
  )

usethis::use_data(md_arcgis_index, overwrite = TRUE)

md_imap_index <- esri2sf::esriIndex(
    url = "https://geodata.md.gov/imap/rest/services",
    recurse = TRUE
  )

md_imap_index <-
  dplyr::arrange(md_imap_index, url) %>%
  dplyr::distinct(url, .keep_all = TRUE) %>%
  dplyr::mutate(
    nm = dplyr::case_when(
      (serviceType == "FeatureServer") & !is.na(geometryType) ~ janitor::make_clean_names(name),
      (serviceType == "MapServer") & !is.na(geometryType) ~ janitor::make_clean_names(glue::glue("{name} map")),
      !is.na(geometryType) ~ janitor::make_clean_names(glue::glue("{name} {serviceType}")),
      urlType == "service" ~ janitor::make_clean_names(glue::glue("{name} {type}")),
      TRUE ~ janitor::make_clean_names(glue::glue("{name} {urlType}"))
    ),
    nm = stringr::str_remove(nm, "_2$"),
    .after = "name"
  )

usethis::use_data(md_imap_index, overwrite = TRUE)

md_arcgis_index_definitions <-
  googlesheets4::read_sheet(
    ss = "https://docs.google.com/spreadsheets/d/1c829bZdNqvbpoizulBU_XE5jVeNNck2kHkS-smpQ52s/edit?usp=sharing",
    sheet = "definitions"
  ) %>%
  dplyr::filter(
    sheet == "services",
    variable != "services_url_linked"
  ) %>%
  dplyr::select(-sheet)

md_arcgis_index_definitions %>%
  dplyr::mutate(
    variable = variable,
    definition = label
  ) %>%
  sinew::tabular()
