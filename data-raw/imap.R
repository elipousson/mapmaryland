library(overedge)
library(dplyr)
state_fips <- 24
pkg_crs <- 3857
pkg_state_abb <- "MD"
pkg_state_name <- "Maryland"

# "https://data.imap.maryland.gov/datasets/maryland-waterbodies-rivers-and-streams-detailed"

url <-
  get_imap_url("rivers_and_streams_detailed")

md_streams_detailed <-
  read_sf_url(url = url)

md_streams_detailed <-
  md_streams_detailed %>%
  dplyr::transmute(
    type = layer
  ) %>%
  sf::st_transform(pkg_crs) %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = name), largest = TRUE) %>%
  rename_sf_col()

# NOTE: md_streams_detailed is no longer being exported

url <-
  get_imap_url("rivers_and_streams_generalized")

md_streams <-
  read_sf_url(url = url) %>%
  sf::st_transform(pkg_crs) %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = name), largest = TRUE) %>%
  rename_sf_col()

# NOTE: md_streams is no longer being exported

url <-
  get_imap_url("county_boundaries_detailed")

md_counties_detailed <-
  read_sf_url(url = url) %>%
  sf::st_transform(pkg_crs) %>%
  rename_sf_col()

md_counties_detailed <-
  dplyr::transmute(
    md_counties_detailed,
    statefp = "24",
    countyfp = stringr::str_pad(county_fip, width = 3, pad = "0"),
    name = county
  ) %>%
  dplyr::left_join(
      dplyr::select(
        sf::st_drop_geometry(md_counties),
        countyfp, geoid, namelsad),
    by = "countyfp"
  )

usethis::use_data(
  md_counties_detailed,
  overwrite = TRUE
)


