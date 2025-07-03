test_that("get_md_tigris works", {
  expect_s3_class(get_md_tigris("Baltimore city"), "sf")

  expect_s3_class(get_md_tigris("Baltimore county"), "sf")

  expect_s3_class(get_md_tigris("Hagerstown", type = "census places"), "sf")

  expect_s3_class(
    get_md_tigris("1st District", type = "congressional districts"),
    "sf"
  )
})
