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

usethis::use_data(type_nm_index, internal = TRUE, overwrite = TRUE)
