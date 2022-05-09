test_that("get_cama_data works", {
  cama_test <-
    get_cama_data(
      location = md_census_places[1, ]
    )

  expect_s3_class(cama_test, "sf")
})

test_that("get_parcel_data works", {
  parcel_test <-
    get_parcel_data(
      location = md_census_places[1, ]
    )

  expect_s3_class(parcel_test, "sf")
})
