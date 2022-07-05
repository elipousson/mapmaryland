type_nm_index <-
  list(
    # Used as index by get_md_open_data
    "md_open_data" = list(
      "crashes" = "maryland_statewide_vehicle_crashes",
      "road closures" = "maryland_road_closures",
      "bay pollution reduction" = "chesapeake_bay_pollution_reduction_activities_fy_2000_fy_2014"
    ),
    # Used as index by get_cama_data
    "imap_cama" = list(
      "core" = "cama_core_map",
      "bldg" = "cama_detailed_building_characteristics_map",
      "land" = "cama_land_map",
      "subarea" = "cama_building_subarea_map"
    ),
    # Used as index by get_parcel_data
    "imap_parcel" = list(
      "boundaries" = "parcel_boundaries_map",
      "points" = "parcel_points_map"
    ),
    # Used as index by get_mht_data
    "imap_mht" = list(
      "mihp" = "maryland_inventory_of_historic_properties",
      "nr" = "national_register_historic_places",
      "easements" = "preservation_easements"
    ),
    # Used as index by get_water_data
    "imap_water" = list(
      "streams detailed" = "rivers_and_streams_detailed",
      "streams" = "rivers_and_streams_generalized",
      "federal watersheds" = "federal_watersheds_huc_11",
      "8 digit watersheds" = "x8_digit_watersheds",
      "12 digit watersheds" = "x12_digit_watersheds",
      "navigable waterways" = "navigable_waterways",
      "ponds" = "large_rivers_lakes_and_ponds"
    )
  )

# usethis::use_data(type_nm_index, internal = TRUE, overwrite = TRUE)

pkg_data <-
  utils::data(package = "mapmaryland")$results[, "Item"]

names(pkg_data) <-
  c(
    "Maryland ArcGIS REST API Services Index",
    "Maryland Census-designated places",
    "Maryland U.S. Congressional Districts",
    "Maryland Counties (detailed boundaries)",
    "Maryland Counties (boundaries)",
    "Maryland House of Delegates Districts (2022)",
    "Maryland iMap Folder/Service Index",
    "Maryland Metropolitan Planning Organizations (boundaries)",
    "Maryland Open Data Portal Index",
    "Maryland Public Schools",
    "Maryland Senate Districts (2022)",
    "Maryland Water (area)",
    "Maryland Zoning District information",
    "Maryland Public School Enrollment (SY 2003-2022)",
    "Maryland Real Property Assessments: Fields Reference",
    "U.S. States (near Maryland)"
  )

pkg_data_index <-
  tibble::enframe(
    pkg_data,
    value = "data"
  )

pkg_data_index <-
  dplyr::bind_cols(
    pkg_data_index,
    "date_updated" = c(
      "2022-06-02", "2022-05-20", "2022-05-19", "2022-05-19", "2022-05-19", "2022-07-05", "2022-05-20",
      "2022-05-23", "2022-05-19", "2022-06-13",  "2022-07-05", "2022-05-19", "2022-05-20", "2022-06-13", "2022-05-19", "2022-05-19"
    )
  )

usethis::use_data(type_nm_index, pkg_data_index, internal = TRUE, overwrite = TRUE)
