## code to prepare `md_esri_index` dataset goes here
library(dplyr)

md_arcgis_index <-
  googlesheets4::read_sheet(
    ss = "https://docs.google.com/spreadsheets/d/1c829bZdNqvbpoizulBU_XE5jVeNNck2kHkS-smpQ52s/edit?usp=sharing",
    sheet = "services"
  )

usethis::use_data(md_arcgis_index, overwrite = TRUE)

md_imap_index <-
  esriIndex(
    url = "https://geodata.md.gov/imap/rest/services",
    recurse = TRUE
  )

md_imap_index <-
  dplyr::mutate(
    md_imap_index,
    nm = janitor::make_clean_names(name),
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
