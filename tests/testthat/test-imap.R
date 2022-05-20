test_that("get_imap_data works", {
  location <- md_census_places[1, ]

  imap_test <-
    get_imap_data(
      location = location,
      nm = "county_boundaries"
    )

  expect_s3_class(imap_test, "sf")

  cama_test <-
    get_cama_data(
      location = location
    )

  expect_s3_class(cama_test, "sf")

  parcel_test <-
    get_parcel_data(
      location = location
    )

  expect_s3_class(parcel_test, "sf")
})
