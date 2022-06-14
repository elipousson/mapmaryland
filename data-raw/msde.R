msde_enrollment <-
  tibble(path = list.files("inst/extdata/msde", full.names = TRUE)) %>%
  filter(str_detect(path, "Enrollment_")) %>%
  mutate(
    data = map(
      path,
      ~ read_csv(.x, col_types = cols(.default = "c"))
    )
  ) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    year = coalesce(academic_year, year),
    school_number = coalesce(school_number, school),
    lss_number = coalesce(lea_number, lss_number, lss),
    lss_name = coalesce(lea_name, lss_name),
    grade = coalesce(grade, grade_title)
  ) %>%
  mutate(
    school_number = case_when(
      school_number == "A" ~ 0L,
      TRUE ~ as.integer(school_number)
    ),
    grade_range = case_when(
      grade == "Total Enrollment" ~ "All Grades",
      grade == "Elementary" ~ "All Elementary Grades",
      grade == "Middle School" ~ "All Middle School Grades",
      grade == "High School" ~ "All High School Grades",
      grade == "All Prekindergarten" ~ "Prekindergarten",
      grade == "Prekindergarten Age 4" ~ "Prekindergarten",
      grade == "All Kindergarten" ~ "Kindergarten",
      TRUE ~ grade
    ),
    race = case_when(
      race == "Two or More Races" ~ "Two or more races",
      race == "Hispanic/Latino of Any Race" ~ "Hispanic/Latino of any race",
      !is.na(race) ~ race,
      TRUE ~ "All"
    ),
    grade = case_when(
      str_detect(grade, "Grade[:space:]") ~ str_remove(grade, "Grade[:space:]"),
      grade %in% c("Prekindergarten", "All Prekindergarten", "Prekindergarten Age 4") ~ "PK",
      grade %in% c("Kindergarten", "All Kindergarten") ~ "K",
      TRUE ~ "*"
    )
  ) %>%
  naniar::replace_with_na(list(grade = "*", enrolled_count = "*")) %>%
  mutate(
    enrolled_count = as.numeric(enrolled_count)
  ) %>%
  select(year, school_number, school_name, enrolled_count, grade, grade_range, race, lss_number, lss_name) %>%
  arrange(desc(year))

usethis::use_data(msde_enrollment, overwrite = TRUE)

public_schools_imap <-
  get_imap_data(nm = "pre_k_thru_12_education_public_schools", crs = 3857)

public_schools <-
  public_schools_imap %>%
  mutate(
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
    grades = str_replace(grades, "SpecEdPK", "PK"),
    grades = str_replace(grades, "^k", "K"),
    grades = case_when(
      str_detect(grades, "^(PreK|Prek|prek|Pre-K|pre-K|pk|PreSchoo|HS)") ~ str_replace(grades, "^(PreK|Prek|prek|Pre-K|pre-K|pk|PreSchoo|HS)", "PK"),
      grades %in% c("Sp.Ed", "Sp. Ed.", "Sp.", "", "0", "Outdoor") ~ NA_character_,
      TRUE ~ grades
    ),
    lss_number = case_when(
      county == "Howard" ~ "13",
      TRUE ~ lss_number
    ),
    management_type = "Traditional"
  ) %>%
  relocate(
    psc_number,
    county,
    .after = lss_number
  ) %>%
  rename(
    address = street
  ) %>%
  overedge::relocate_sf_col() %>%
  select(-objectid)

charter_schools_imap <-
  get_imap_data(nm = "k_thru_12_education_charter_schools", crs = 3857)

charter_schools <- charter_schools_imap %>%
  overedge::rename_with_xwalk(
    list(
      "school_name" = "school_nam",
      "management_type" = "type"
    )
  ) %>%
  mutate(
    grades = str_remove(grades, "^Grades:"),
    grades = str_remove(grades, "[:space:]"),
    zip = as.character(zip),
    grade_band = case_when(
      grades %in% c("PK-5", "PK-3", "K-5", "K-6") ~ "E",
      grades %in% c("K-8", "PK-8") ~ "EM",
      grades %in% c("6-8", "6-7") ~ "M",
      grades %in% c("6-12", "6-10") ~ "MH",
      grades == "9-12" ~ "H",
      TRUE ~ "Other"
    ),
    lss_number = case_when(
      county == "Baltimore City" ~ "30",
      county == "Anne Arundel" ~ "02",
      county == "Prince George's" ~ "16",
      county == "St. Mary's" ~ "18",
      county == "Frederick" ~ "10"
    )
  ) %>%
  select(-objectid)

md_schools <-
  dplyr::bind_rows(
    public_schools,
    charter_schools
  ) %>%
  arrange(county, grade_band)

md_schools <- md_schools %>%
  dplyr::left_join(
    distinct(msde_enrollment %>% filter(year == 2022) %>% select(school_name, school_number, lss_number), school_name, school_number, lss_number),
    by = c("school_name", "lss_number")
  )

usethis::use_data(md_schools, overwrite = TRUE)
