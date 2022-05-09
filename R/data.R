#' Maryland ArcGIS REST API Services Index
#'
#' A non-comprehensive list of ArcGIS services maintained by public agencies,
#' academic units, and nonprofit organizations in Maryland. Layers available at
#' the service_url can be accessed using the [{esri2sf}
#' package](https://github.com/yonghah/esri2sf).
#'
#' Comments, additions,
#' or corrections can be submitted using comments on this open Google Sheet:
#' <https://docs.google.com/spreadsheets/d/1c829bZdNqvbpoizulBU_XE5jVeNNck2kHkS-smpQ52s/edit?usp=sharing>
#'
#' @format A data frame with 67 rows and 14 variables:
#' \describe{
#'   \item{\code{name}}{character Source name}
#'   \item{\code{operator.abb}}{character Operator abbreviation}
#'   \item{\code{operator}}{character Operator name}
#'   \item{\code{city}}{character City name}
#'   \item{\code{county}}{character County name}
#'   \item{\code{state}}{character State name}
#'   \item{\code{state.abb}}{character State name abbreviation}
#'   \item{\code{geography}}{character Geographic scope; Options include
#'   citywide, countywide, regional (multi-county), statewide, or regional
#'   (multistate).}
#'   \item{\code{source_type}}{character Source type}
#'   \item{\code{notes}}{character Notes}
#'   \item{\code{public}}{logical Public data indicator}
#'   \item{\code{services_url}}{character Services URL}
#'   \item{\code{hosting}}{character Hosting type; Currently used as an
#'   indicator for ArcGIS Online hosted data with other services assumed to be
#'   self-hosted by the source or operator.}
#' }
"md_arcgis_index"

#' Maryland Counties (boundaries)
#'
#' County boundaries downloaded from the U.S. Census Bureau with the
#' [tigris::counties] function. Counties in the Baltimore–Columbia–Towson
#' Metropolitan Statistical Area (MSA) include Baltimore City, Baltimore County,
#' Carroll County, Anne Arundel County, Howard County, Queen Anne's County, and
#' Harford County. Counties in the DC-VA-MD-WV Metropolitan Statistical Area
#' (MSA) include Montgomery, Frederick, Prince George's, Charles, and Calvert
#' counties.
#'
#' @format A data frame with 24 rows and 18 variables:
#' \describe{
#'   \item{\code{statefp}}{State FIPS code for Maryland}
#'   \item{\code{countyfp}}{County FIPS code}
#'   \item{\code{countyns}}{County GNIS code}
#'   \item{\code{geoid}}{Unique county FIPS code (concatenation of state and county FIPS codes)}
#'   \item{\code{name}}{County name}
#'   \item{\code{namelsad}}{Concatenated variable length geographic area name and legal/statistical area description (LSAD)}
#'   \item{\code{lsad}}{Legal/statistical area description (LSAD)}
#'   \item{\code{classfp}}{FIPS class code}
#'   \item{\code{mtfcc}}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{\code{csafp}}{Combined statistical area code}
#'   \item{\code{cbsafp}}{Metropolitan statistical area/micropolitan statistical area code}
#'   \item{\code{metdivfp}}{Metropolitan division code}
#'   \item{\code{funcstat}}{Functional status}
#'   \item{\code{aland}}{Land area (square meters)}
#'   \item{\code{awater}}{Water area (square meters)}
#'   \item{\code{intptlat}}{Latitude of the internal point}
#'   \item{\code{intptlon}}{Longitude of the internal point}
#'   \item{\code{geometry}}{Multipolygon with the county boundary}
#' }
#' @source \url{https://www.census.gov/geo/maps-data/data/tiger-line.html}
"md_counties"

#' U.S. Congressional Districts for Maryland
#'
#' U.S. Congressional Districts boundaries downloaded from the U.S. Census Bureau with the
#' [tigris::congressional_districts] function.
#'
#' @format A data frame with 8 rows and 13 variables:
#' \describe{
#'   \item{\code{statefp}}{2-character state FIPS code}
#'   \item{\code{cd116fp}}{116th congressional district FIPS code}
#'   \item{\code{geoid}}{GeoID}
#'   \item{\code{namelsad}}{concatenated variable length geographic area name and legal/statistical area description (LSAD)}
#'   \item{\code{lsad}}{Legal/statistical area description (LSAD)}
#'   \item{\code{cdsessn}}{Congressional session code}
#'   \item{\code{mtfcc}}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{\code{funcstat}}{functional status}
#'   \item{\code{aland}}{land area (square meters)}
#'   \item{\code{awater}}{water area (square meters)}
#'   \item{\code{intptlat}}{latitude of the internal point}
#'   \item{\code{intptlon}}{longitude of the internal point}
#'   \item{\code{label}}{Congressional District label}
#'   \item{\code{name}}{Congressional District name}
#'   \item{\code{geometry}}{Multipolygon with Congressional district boundary}
#' }
"md_congressional_districts"

#' Maryland Water (area)
#'
#' Detailed multipolygon data for streams, lakes, and other water in the state
#' of Maryland downloaded from the U.S. Census Bureau with the
#' [tigris::area_water] function.
#'
#' @format A data frame with 14970 rows and 9 variables:
#' \describe{
#'   \item{\code{ansicode}}{character ANSI code}
#'   \item{\code{hydroid}}{character Hydroid}
#'   \item{\code{fullname}}{character Full name}
#'   \item{\code{mtfcc}}{character MAF/TIGER Feature Class Code}
#'   \item{\code{aland}}{double Land area}
#'   \item{\code{awater}}{double Water area}
#'   \item{\code{intptlat}}{character Interior latitude point}
#'   \item{\code{intptlon}}{character Interior longitude point}
#'   \item{\code{geometry}}{list Multipolygon geometry}
#' }
#' @source \url{https://data.imap.maryland.gov/datasets/maryland-waterbodies-rivers-and-streams-detailed}
"md_water"


#' Maryland Rivers and Streams (detailed)
#'
#' @format A data frame with 95507 rows and 4 variables:
#' \describe{
#'   \item{\code{type}}{character Type}
#'   \item{\code{countyfp}}{character County FIPS}
#'   \item{\code{county}}{character County name}
#'   \item{\code{geometry}}{list Multipolygon geometry}
#'}
#' @source \url{https://geodata.md.gov/imap/rest/services/Hydrology/MD_Waterbodies/FeatureServer/2}
"md_streams_detailed"


#' Maryland Rivers and Streams
#'
#' @format A data frame with 347 rows and 12 variables:
#' \describe{
#'   \item{\code{objectid}}{integer GIS Object ID}
#'   \item{\code{huc}}{character Hydrologic Unit}
#'   \item{\code{lev}}{double Stream Level}
#'   \item{\code{pname}}{character Name}
#'   \item{\code{owname}}{character Open Water Name}
#'   \item{\code{edaname}}{character Estuarine Coastal Drainage Area Name}
#'   \item{\code{huc2}}{double HUC 2 Digit}
#'   \item{\code{huc4}}{double HUC 4 Digit}
#'   \item{\code{huc6}}{double HUC 6 Digit}
#'   \item{\code{countyfp}}{County FIPS}
#'   \item{\code{county}}{County name}
#'   \item{\code{geometry}}{Multipolygon geometry}
#'}
#' @source \url{https://geodata.md.gov/imap/rest/services/Hydrology/MD_Waterbodies/FeatureServer/0}
"md_streams"


#' @title  Maryland Real Property Assessments: Fields Reference
#'
#' @format A data frame with 223 rows and 6 variables:
#' \describe{
#'   \item{\code{field_order}}{Field order}
#'   \item{\code{field_name}}{Field name}
#'   \item{\code{data_type}}{Data type}
#'   \item{\code{mdp_field_name}}{Maryland Department of Planning (MDP) Field name}
#'   \item{\code{api_field_name}}{Maryland Open Data portal API field name}
#'   \item{\code{sdat_field_number}}{State Department of Assessments and Taxation (SDAT) field number}
#'}
#' @source \url{https://opendata.maryland.gov/Business-and-Economy/Maryland-Real-Property-Assessments-Fields-Referenc/w8th-47fz/data}
"real_property_cols"


