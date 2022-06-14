<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# mapmaryland 0.1.0.9000 (2022-06-13)

- refactor: set location default to NULL to allow `get_imap_data()` to work w/ no location
- feat: add `msde_enrollment` data frame and `md_schools` simple features data frame
- refactor: limit `set_mapmaryland_options()` support to crs parameter
- refactor: add null.ok parameter to type2nm
- feat: export `md_census_places` + remove md_senate_districts
- refactor: add server_type column to `md_imap_index`
- fix: transform `md_census_places` to 3857
- refactor: add countyfp and county column to `md_census_places`
- refactor: replace get_md_boundary w/ `get_md_tigris()`
- feat: add support to more data sources including sources downloaded w/ the tigris package
- feat: add CRS support to `get_md_tigris()` and erase_water option
- feat: add `format_md_sf()` function
- feat: add more datasets from tigris
- feat: add `us_states_near_md` data
- feat: add `get_imap_data` function
- test: consolidate tests for `get_imap_data` and related functions
- feat: add `get_cama_data()` and `get_parcel_data()` (using Maryland iMap data)
- test: add tests for `get_cama_data()` and `get_parcel_data()`
- refactor: add overedge as a dependency
- feat: update `md_arcgis_index` to ensure consistency of service_url data


