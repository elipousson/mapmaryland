library(dplyr)

state_fips <- 24
pkg_crs <- 3857
pkg_state_abb <- "MD"
pkg_state_name <- "Maryland"

options(tigris_use_cache = TRUE)

# https://github.com/r-spatial/sf/issues/1341#issuecomment-1120284345
escape_crs <- function(x) {
  sf::st_crs(x)$wkt <- gsub(
    "°|º", "\\\u00b0",
    sf::st_crs(x)$wkt
  )

  x
}

region_county_xwalk <-
  tibble::tribble(
    ~region,                   ~namelsad,
    "Western Maryland",          "Garrett County",
    "Western Maryland",         "Allegany County",
    "Western Maryland",       "Washington County",
    "Capital Region",        "Frederick County",
    "Capital Region",       "Montgomery County",
    "Capital Region",  "Prince George's County",
    "Central Maryland",     "Anne Arundel County",
    "Central Maryland",          "Baltimore city",
    "Central Maryland",        "Baltimore County",
    "Central Maryland",          "Carroll County",
    "Central Maryland",          "Harford County",
    "Central Maryland",           "Howard County",
    "Southern Maryland",          "Calvert County",
    "Southern Maryland",          "Charles County",
    "Southern Maryland",       "St. Mary's County",
    "Eastern Shore",             "Kent County",
    "Eastern Shore",     "Queen Anne's County",
    "Eastern Shore",           "Talbot County",
    "Eastern Shore",         "Caroline County",
    "Eastern Shore",       "Dorchester County",
    "Eastern Shore",         "Wicomico County",
    "Eastern Shore",         "Somerset County",
    "Eastern Shore",        "Worcester County",
    "Eastern Shore",            "Cecil County"
  )

md_counties <-
  tigris::counties(state = state_fips) %>%
  janitor::clean_names("snake") %>%
  left_join(region_county_xwalk) %>%
  sf::st_transform(pkg_crs) |>
  escape_crs()

usethis::use_data(md_counties, overwrite = TRUE)

md_water <- md_counties$countyfp %>%
  purrr::map_dfr(
    ~ tigris::area_water(state = pkg_state_abb, county = .x)
  ) %>%
  sf::st_simplify(dTolerance = 1) %>%
  sf::st_transform(pkg_crs) %>%
  janitor::clean_names("snake") |>
  escape_crs()

usethis::use_data(md_water, overwrite = TRUE)

md_congressional_districts <-
  tigris::congressional_districts(state = state_fips) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(pkg_crs)

congressional_district_labels <-
  tibble::tribble(
    ~cd118fp, ~label, ~name,
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
  dplyr::left_join(congressional_district_labels, by = "cd118fp") %>%
  sfext::relocate_sf_col() |>
  escape_crs()

usethis::use_data(md_congressional_districts, overwrite = TRUE)

md_census_places <-
  tigris::places(state = pkg_state_abb) %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

md_census_places <- md_census_places %>%
  sf::st_join(dplyr::select(md_counties, countyfp, county = namelsad)) %>%
  dplyr::relocate(countyfp, .after = "statefp") %>%
  dplyr::relocate(county, .after = "intptlon") %>%
  dplyr::select(-pcinecta) |>
  escape_crs()

usethis::use_data(md_census_places, overwrite = TRUE)

us_states <- tigris::states() %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake")

us_states_near_md <- getdata::get_location_data(
  location = md_counties,
  data = us_states,
  asp = 1,
  crop = FALSE
) |>
  escape_crs()

usethis::use_data(us_states_near_md, overwrite = TRUE)

# md_senate_districts <-
#   tigris::state_legislative_districts(state = pkg_state_abb) %>%
#   sf::st_transform(crs = pkg_crs) %>%
#   janitor::clean_names("snake") |>
#   escape_crs()
#
# usethis::use_data(md_senate_districts, overwrite = TRUE)


# md_legislative_districts <-
#   tigris::state_legislative_districts(state = pkg_state_abb, house = "lower") %>%
#   sf::st_transform(crs = pkg_crs) %>%
#   janitor::clean_names("snake") |>
#   escape_crs()
#
# usethis::use_data(md_legislative_districts, overwrite = TRUE)

md_zctas <- tigris::zctas() %>%
  sf::st_transform(crs = pkg_crs) %>%
  janitor::clean_names("snake") %>%
  sf::st_filter(
    md_counties %>%
      sfext::st_buffer_ext(dist = -500, unit = "m")
  ) |>
  escape_crs()

usethis::use_data(md_zctas, overwrite = TRUE)
