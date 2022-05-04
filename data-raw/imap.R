library(overedge)
library(dplyr)

  # "https://data.imap.maryland.gov/datasets/maryland-waterbodies-rivers-and-streams-detailed"

url <-
  "https://geodata.md.gov/imap/rest/services/Hydrology/MD_Waterbodies/FeatureServer/2"

md_streams_detailed <-
  read_sf_url(url = url)

md_streams_detailed <-
  md_streams_detailed %>%
  dplyr::transmute(
    type = layer
  ) %>%
  sf::st_transform(3857) %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = name), largest = TRUE) %>%
  rename_sf_col()

usethis::use_data(
  md_streams_detailed,
  overwrite = TRUE
  )

url <-
  "https://geodata.md.gov/imap/rest/services/Hydrology/MD_Waterbodies/FeatureServer/0"

md_streams <-
  read_sf_url(url = url) %>%
  sf::st_transform(3857) %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = name), largest = TRUE) %>%
  rename_sf_col()

usethis::use_data(
  md_streams,
  overwrite = TRUE
)

