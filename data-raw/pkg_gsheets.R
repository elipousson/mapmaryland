
md_zoning_info <-
  googlesheets4::read_sheet(
    "https://docs.google.com/spreadsheets/d/1qu8s3W9tvtMPvqLNpzrxqybqPSnl67aBBItSWRgbdto/edit?usp=sharing"
  )

md_zoning_info <-
  md_zoning_info %>%
  getdata:::str_trim_squish() %>%
  tidyr::replace_na(replace = list(overlay = FALSE))

md_zoning_info <-
  md_zoning_info %>%
  naniar::replace_with_na(replace = list("article" = "NA", "article" = "NULL"))

usethis::use_data(md_zoning_info, overwrite = TRUE)
