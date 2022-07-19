library(dplyr)
state_fips <- 24
pkg_crs <- 3857
pkg_state_abb <- "MD"
pkg_state_name <- "Maryland"

md_counties <-
  tigris::counties(state = state_fips) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(pkg_crs)

usethis::use_data(md_counties, overwrite = TRUE)

md_water <- md_counties$countyfp %>%
  purrr::map_dfr(
    ~ tigris::area_water(state = pkg_state_abb, county = .x)
  ) %>%
  sf::st_simplify(dTolerance = 1) %>%
  sf::st_transform(pkg_crs) %>%
  janitor::clean_names("snake")

usethis::use_data(md_water, overwrite = TRUE)

md_congressional_districts <-
  tigris::congressional_districts(state = state_fips) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(pkg_crs)

congressional_district_labels <-
  tibble::tribble(
    ~cd116fp, ~label, ~name,
    "01", "Maryland's 1st congressional district", "1st District",
    "03", "Maryland's 3rd congressional district", "3rd District",
    "04", "Maryland's 4th congressional district", "4th District",
    "05", "Maryland's 5th congressional district", "5th District",
    "07", "Maryland's 7th congressional district", "7th District",
    "02", "Maryland's 2nd congressional district", "2nd District",
    "06", "Maryland's 6th congressional district", "6th District",
    "08", "Maryland's 8th congressional district", "2nd District"
  )

md_congressional_districts <-
  md_congressional_districts %>%
  dplyr::left_join(congressional_district_labels, by = "cd116fp") %>%
  sfext::relocate_sf_col()

usethis::use_data(md_congressional_districts, overwrite = TRUE)

md_census_places <-
  tigris::places(state = pkg_state_abb) %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

md_census_places <- md_census_places %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = namelsad)) %>%
  dplyr::relocate(countyfp, .after = "statefp") %>%
  dplyr::relocate(county, .after = "intptlon") %>%
  dplyr::select(-pcinecta)

usethis::use_data(md_census_places, overwrite = TRUE)

us_states <-
  tigris::states() %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

us_states_near_md <-
  getdata::get_location_data(
    location = md_counties,
    data = us_states,
    asp = 1,
    crop = FALSE
  )

usethis::use_data(us_states_near_md, overwrite = TRUE)


md_senate_districts <-
  tigris::state_legislative_districts(state = pkg_state_abb) %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

usethis::use_data(md_senate_districts, overwrite = TRUE)


md_legislative_districts <-
  tigris::state_legislative_districts(state = pkg_state_abb, house = "lower") %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

usethis::use_data(md_legislative_districts, overwrite = TRUE)
