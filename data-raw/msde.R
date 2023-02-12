library(tidyverse)
library(getdata)

msde_enrollment <- marylandedu::msde_enrollment

usethis::use_data(msde_enrollment, overwrite = TRUE)

public_schools_imap <-
  mapmaryland::get_imap_data(nm = "pre_k_thru_12_education_public_schools", crs = 3857)

public_schools <-
  public_schools_imap %>%
  mutate(
    street = str_to_title(str_trim(str_squish(street))),
    street = str_replace(street, "[:space:]Sw$", " SW"),
    street = str_replace(street, "[:space:]Nw$", " NW"),
    street = str_replace(street, "[:space:]Mcm", " McM"),
    city = str_to_title(str_trim(str_squish(city))),
    school_type = str_trim(str_squish(school_type)),
    school_type = case_when(
      school_type == "PreK-8" ~ "Elementary/Middle",
      TRUE ~ school_type
    ),
    grade_band = case_when(
      school_type == "Elementary" ~ "E",
      school_type == "Middle" ~ "M",
      school_type == "Elementary/Middle" ~ "EM",
      school_type == "Elementary/Middle/High" ~ "EMH",
      school_type == "Middle/High" ~ "MH",
      school_type == "High" ~ "H",
      TRUE ~ "Other"
    ),
    lss_number = str_extract(psc_number, ".+(?=\\.)"),
    grades = str_remove(grades, ";$|,$|/ELC$"),
    # special_ed = school_type == "Special Ed." | grades %in% c("Sp.Ed", "Sp. Ed.", "Sp.", "SpecEdPK"),
    grades = str_replace(grades, "SpecEdPK", "PK"),
    grades = str_replace(grades, "^k", "K"),
    grades = case_when(
      str_detect(grades, "^(PreK|Prek|prek|Pre-K|pre-K|pk|PreSchoo|HS)") ~ str_replace(grades, "^(PreK|Prek|prek|Pre-K|pre-K|pk|PreSchoo|HS)", "PK"),
      grades %in% c("Sp.Ed", "Sp. Ed.", "Sp.", "", "0", "Outdoor") ~ NA_character_,
      TRUE ~ grades
    ),
    grades = str_remove_all(grades, "[:space:]"),
    lss_number = case_when(
      county == "Howard" ~ "13",
      TRUE ~ lss_number
    ),
    lss_number = as.integer(lss_number),
    management_type = "Traditional",
    grade_band = case_when(
      grade_band == "Other" & (grades %in% c("9-12")) ~ "H",
      grade_band == "Other" & (grades %in% c("6-12")) ~ "MH",
      grade_band == "Other" & (grades %in% c("K-8")) ~ "EM",
      grade_band == "Other" & (grades %in% c("PK-5")) ~ "E",
      TRUE ~ grade_band
    )
  ) %>%
  relocate(
    county,
    .after = lss_number
  ) %>%
  relocate(
    psc_number,
    .before = lss_number
  ) %>%
  rename(
    address = street
  ) %>%
  mutate(
    school_name = str_squish(str_trim(school_name)),
    # school_number = strex::str_after_first(school_name, "#"),
    # remove_from_num = strex::str_after_first(school_number, "[:punct:]")#,
    # school_number = str_remove(school_number, remove_from_num),
    # school_number = as.integer(school_number)
    # school_number = as.integer(strex::str_after_first(psc_number, "\\.")),
  ) |>
  sfext::relocate_sf_col() %>%
  select(-objectid)

charter_schools_imap <-
  mapmaryland::get_imap_data(nm = "k_thru_12_education_charter_schools", crs = 3857)

charter_schools <- charter_schools_imap %>%
  getdata::rename_with_xwalk(
    xwalk = list(
      "school_name" = "school_nam",
      "management_type" = "type"
    )
  ) %>%
  mutate(
    school_name = str_squish(str_trim(school_name)),
    grades = str_remove(grades, "^Grades:"),
    grades = str_remove_all(grades, "[:space:]"),
    zip = as.character(zip),
    grade_band = case_when(
      grades %in% c("PK-5", "PK-3", "K-5", "K-6") ~ "E",
      grades %in% c("K-8", "PK-8") ~ "EM",
      grades %in% c("6-8", "6-7") ~ "M",
      grades %in% c("6-12", "6-10") ~ "MH",
      grades == "9-12" ~ "H",
      TRUE ~ "Other"
    ),
    school_type = case_when(
      grade_band == "E" ~ "Elementary",
      grade_band == "EM" ~ "Elementary/Middle",
      grade_band == "M" ~ "Middle",
      grade_band == "MH" ~ "Middle/High",
      grade_band == "H" ~ "High"
    ),
    lss_number = case_when(
      county == "Baltimore City" ~ "30",
      county == "Anne Arundel" ~ "02",
      county == "Prince George's" ~ "16",
      county == "St. Mary's" ~ "18",
      county == "Frederick" ~ "10"
    ),
    grade_band = case_when(
      grade_band == "Other" & (grades %in% c("9-12")) ~ "H",
      grade_band == "Other" & (grades %in% c("6-12")) ~ "MH",
      grade_band == "Other" & (grades %in% c("K-8", "PK-8")) ~ "EM",
      grade_band == "Other" & (grades %in% c("PK-5")) ~ "E",
      TRUE ~ grade_band
    ),
    lss_number = as.integer(lss_number)
  ) %>%
  select(-objectid)

md_schools <-
  dplyr::bind_rows(
    public_schools,
    charter_schools
  ) %>%
  arrange(county, grade_band, school_name)

usethis::use_data(md_schools, overwrite = TRUE)

# current_enrollment <- msde_enrollment |>
#   filter(year == 2022) |>
#   mutate(
#     school_name_key = str_remove(school_name, "(PK-8)|(3-8)|(PK-5)|(PK-2)|(K-8)|(PK-12)"),
#     key = glue::glue("{school_name_key}{county}"),
#     key = tolower(str_remove_all(key, "[:space:]|[:punct:]"))#,
#     # alt_number = parse_number(key)
#   ) |>
#   select(school_number, enrolled_count, key) |>
#   distinct(key, school_number, .keep_all = TRUE)
#
# # md_schools_geometry <- md_schools
# #
# md_schools_join <- md_schools %>%
#   #sf::st_drop_geometry() |>
#   mutate(
#     school_name_key = str_remove(school_name, "(PK-8)|(3-8)|(PK-5)|(PK-2)|(K-8)|(PK-12)"),
#     key = glue::glue("{school_name_key}{county}"),
#     key = tolower(str_remove_all(key, "[:space:]|[:punct:]"))
#   ) |>
#   power_left_join(
#     current_enrollment,
#     by = "key"
#   )
