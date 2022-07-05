library(getdata)
library(dplyr)

md_house_districts_2022 <-
  sf::read_sf("data-raw/2022HOUSEOFFICIAL/2022HOUSEOFFICIAL.shp")

md_house_districts_2022 <-
  md_house_districts_2022 %>%
  janitor::clean_names("snake") %>%
  rename_sf_col() %>%
  dplyr::mutate(
    district = stringr::str_remove(district, "^0"),
    name = paste("District", district),
    label = paste("Maryland House of Delegates", name)
  ) %>%
  dplyr::select(
    name,
    id = district,
    label,
    members = members,
    pop = adj_popula,
    sort_id = district_n
  ) %>%
  arrange(sort_id, id) %>%
  select(-sort_id)

md_house_districts_2022 <- md_house_districts_2022 %>%
  sfext::st_transform_ext(3857)

usethis::use_data(md_house_districts_2022, overwrite = TRUE)

md_senate_districts_2022 <-
  sf::read_sf("data-raw/2022SENATEOFFICIAL/2022SENATEOFFICIAL.shp")

md_senate_districts_2022 <-
  md_senate_districts_2022 %>%
  janitor::clean_names("snake") %>%
  rename_sf_col() %>%
  dplyr::mutate(
    district = as.integer(stringr::str_remove(district, "^SD")),
    name = paste("District", district),
    label = paste("Maryland Senate", name)
  ) %>%
  dplyr::select(
    name,
    id = district,
    label,
    pop = adj_popula
  ) %>%
  dplyr::arrange(id) %>%
  mutate(
    id = as.character(id)
  ) %>%
  sfext::st_transform_ext(3857)

usethis::use_data(md_senate_districts_2022, overwrite = TRUE)
