test_that("get_md_boundary works", {
  expect_s3_class(get_md_boundary("Baltimore city"), "sf")

  expect_s3_class(get_md_boundary("Baltimore county"), "sf")

  expect_s3_class(get_md_boundary("Hagerstown", type = "census place"), "sf")

  expect_s3_class(get_md_boundary("1st District", type = "congressional district"), "sf")
})
