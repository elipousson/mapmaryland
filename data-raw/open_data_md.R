

real_property_cols <-
  get_socrata_data(
    data = "w8th-47fz",
    source_url = "https://opendata.maryland.gov",
    token = "DKHfqsI1offbLTfYpi9rmSQQl"
  )

usethis::use_data(
  real_property_cols,
  overwrite = TRUE
)
