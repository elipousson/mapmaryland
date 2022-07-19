
real_property_cols <-
  getdata::get_socrata_data(
    data = "w8th-47fz",
    source_url = "https://opendata.maryland.gov",
    token = "DKHfqsI1offbLTfYpi9rmSQQl"
  )

usethis::use_data(
  real_property_cols,
  overwrite = TRUE
)

md_open_data_index <-
  getdata::get_socrata_data(
    data = "list",
    source_url = "https://opendata.maryland.gov",
    token = "DKHfqsI1offbLTfYpi9rmSQQl"
  )

md_open_data_index <- md_open_data_index %>%
  dplyr::rename(
    name = title,
    url = landingPage
  ) %>%
  dplyr::select(-c(accessLevel, `@type`, contactPoint, publisher, distribution)) %>%
  dplyr::filter(!stringr::str_detect(name, "iMAP"), !stringr::str_detect(description, "iMAP")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(
    nm = janitor::make_clean_names(name),
    resource = stringr::str_remove(url, "https://opendata.maryland.gov/d/"),
    .before = everything()
  )

md_open_data_index <- md_open_data_index %>%
  dplyr::relocate(
    name,
    nm,
    resource,
    description,
    .before = everything()
  ) %>%
  dplyr::arrange(
    name
  )

usethis::use_data(
  md_open_data_index,
  overwrite = TRUE
)
