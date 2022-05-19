
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mapmaryland

<!-- badges: start -->
<!-- badges: end -->

The goal of mapmaryland is to ease access to spatial data for Maryland
at both the local, regional, and statewide level.

## Installation

You can install the development version of mapmaryland like so:

``` r
# devtools::install_github("elipousson/mapmaryland")
```

## Example

``` r
library(mapmaryland)
## basic example code
```

Currently, the package has a limited number of data access functions,
prepackaged datasets, and reference data with an index of Maryland
ArcGIS services.

``` r
dplyr::glimpse(md_arcgis_index)
#> Rows: 67
#> Columns: 13
#> $ name         <chr> NA, NA, NA, "GEOLOOM (Baltimore Neighborhood Indicators A…
#> $ operator.abb <chr> NA, NA, NA, "BNIA", "BNIA", "BCIT", NA, "BCIT", "BCIT", "…
#> $ operator     <chr> NA, NA, NA, "Baltimore Neighborhood Indicators Alliance",…
#> $ city         <chr> NA, NA, NA, "Baltimore", "Baltimore", "Baltimore", "Balti…
#> $ county       <chr> "Allegany County", "Anne Arundel County", "Anne Arundel C…
#> $ state        <chr> "Maryland", "Maryland", "Maryland", "Maryland", "Maryland…
#> $ state.abb    <chr> "MD", "MD", "MD", "MD", "MD", "MD", "MD", "MD", "MD", "MD…
#> $ geography    <chr> "countywide", "countywide", "countywide", "citywide", "ci…
#> $ source_type  <chr> "county government", "county government", "county governm…
#> $ notes        <chr> NA, NA, NA, "Project specific server but includes overlap…
#> $ public       <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRU…
#> $ services_url <chr> "https://alleganygis.allconet.org/allcogis/rest/services"…
#> $ hosting      <chr> NA, NA, NA, "ArcGIS Online", "ArcGIS Online", NA, NA, NA,…
```
