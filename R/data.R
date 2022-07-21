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
#' counties. Regions are based on this resource from Visit Maryland
#' <https://www.visitmaryland.org/info/maryland-regions>
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
#'   \item{\code{region}}{Region of the state}
#'   \item{\code{geometry}}{Multipolygon with the county boundary}
#' }
#' @source \url{https://www.census.gov/geo/maps-data/data/tiger-line.html}
"md_counties"


#' Maryland Counties (detailed boundaries)
#'
#' Detailed boundaries for Maryland counties from Maryland iMap.
#'
#' @format A data frame with 24 rows and 6 variables:
#' \describe{
#'   \item{\code{statefp}}{State FIPS code for Maryland}
#'   \item{\code{countyfp}}{County FIPS code}
#'   \item{\code{name}}{County name}
#'   \item{\code{geoid}}{Unique county GeoID (concatenation of state and county FIPS codes)}
#'   \item{\code{namelsad}}{Concatenated variable length geographic area name and legal/statistical area description (LSAD)}
#'   \item{\code{geometry}}{Multipolygon with the county boundary}
#' }
"md_counties_detailed"


#' Maryland Census-designated places
#'
#' Census Designated Places (CDPs) in the state of Maryland downloaded using the
#' [tigris::places] function.
#'
#' @format A data frame with 536 rows and 17 variables:
#' \describe{
#'   \item{\code{statefp}}{State FIPS code for Maryland}
#'   \item{\code{county}}{County name}
#'   \item{\code{countyfp}}{County FIPS code}
#'   \item{\code{placefp}}{CDP FIPS code}
#'   \item{\code{placens}}{CDP GNIS code}
#'   \item{\code{geoid}}{Unique CDP GeoID}
#'   \item{\code{name}}{Place name}
#'   \item{\code{namelsad}}{Place Legal/statistical area description (LSAD)}
#'   \item{\code{lsad}}{Legal/statistical area description (LSAD)}
#'   \item{\code{classfp}}{Class FIPS code}
#'   \item{\code{pcicbsa}}{Current metropolitan/micropolitan statistical area principal city indicator}
#'   \item{\code{mtfcc}}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{\code{funcstat}}{Functional status}
#'   \item{\code{aland}}{Land area (square meters)}
#'   \item{\code{awater}}{Water area (square meters)}
#'   \item{\code{intptlat}}{Latitude of the internal point}
#'   \item{\code{intptlon}}{Longitude of the internal point}
#'   \item{\code{geometry}}{list COLUMN_DESCRIPTION}
#' }
"md_census_places"


#' Maryland U.S. Congressional Districts
#'
#' U.S. Congressional Districts boundaries downloaded from the U.S. Census Bureau with the
#' [tigris::congressional_districts] function.
#'
#' @format A data frame with 8 rows and 13 variables:
#' \describe{
#'   \item{\code{statefp}}{2-character state FIPS code}
#'   \item{\code{cd116fp}}{116th congressional district FIPS code}
#'   \item{\code{geoid}}{GeoID}
#'   \item{\code{namelsad}}{concatenated variable with geographic area name and legal/statistical area description (LSAD)}
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
#'   \item{\code{geometry}}{Multipolygon with district boundary}
#' }
"md_congressional_districts"

#' U.S. States (near Maryland)
#'
#' U.S. states bordering Maryland or in close proximity.
#'
#' @format A data frame with 7 rows and 15 variables:
#' \describe{
#'   \item{\code{region}}{character Region ID}
#'   \item{\code{division}}{character Division ID}
#'   \item{\code{statefp}}{2-character state FIPS code}
#'   \item{\code{statens}}{character State National Standard (NS) identifier using U.S. Geological Survey’s Geographic Names Information System (GNIS) code}
#'   \item{\code{geoid}}{character GeoID}
#'   \item{\code{stusps}}{character State U.S. Postal Service abbreviation}
#'   \item{\code{name}}{character State name}
#'   \item{\code{lsad}}{Legal/statistical area description (LSAD)}
#'   \item{\code{mtfcc}}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{\code{funcstat}}{functional status}
#'   \item{\code{aland}}{land area (square meters)}
#'   \item{\code{awater}}{water area (square meters)}
#'   \item{\code{intptlat}}{latitude of the internal point}
#'   \item{\code{intptlon}}{longitude of the internal point}
#'   \item{\code{geometry}}{list Geometry}
#' }
"us_states_near_md"

#' Maryland Water (area)
#'
#' Detailed multipolygon data for streams, lakes, and other water in the state
#' of Maryland downloaded from the U.S. Census Bureau with the
#' [tigris::area_water] function.
#'
#' @format A data frame with 14,970 rows and 9 variables:
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

#' Maryland Real Property Assessments (fields reference)
#'
#' @format A data frame with 223 rows and 6 variables:
#' \describe{
#'   \item{\code{field_order}}{Field order}
#'   \item{\code{field_name}}{Field name}
#'   \item{\code{data_type}}{Data type}
#'   \item{\code{mdp_field_name}}{Maryland Department of Planning (MDP) Field name}
#'   \item{\code{api_field_name}}{Maryland Open Data portal API field name}
#'   \item{\code{sdat_field_number}}{State Department of Assessments and Taxation (SDAT) field number}
#' }
#' @source \url{https://opendata.maryland.gov/Business-and-Economy/Maryland-Real-Property-Assessments-Fields-Referenc/w8th-47fz/data}
"real_property_cols"

#' Maryland iMap Folder/Service Index
#'
#' Created using esriIndex function (in process of being developed for esri2sf
#' package).
#'
#' @format A data frame with 1477 rows and 15 variables:
#' \describe{
#'   \item{\code{name}}{character Name}
#'   \item{\code{nm}}{character Name with snake case}
#'   \item{\code{index}}{character Index type}
#'   \item{\code{type}}{character Service/layer type}
#'   \item{\code{server_type}}{character Server type}
#'   \item{\code{url}}{character Folder/service/layer URL}
#'   \item{\code{parent}}{character Parent folder/service/layer}
#'   \item{\code{id}}{integer Layer ID number}
#'   \item{\code{parentLayerId}}{integer Parent layer ID number}
#'   \item{\code{defaultVisibility}}{logical Layer default visibility}
#'   \item{\code{minScale}}{double Minimum scale}
#'   \item{\code{maxScale}}{integer Maximum scale}
#'   \item{\code{geometryType}}{character Geometry type}
#'   \item{\code{subLayerIds}}{list Sublayer ID numbers}
#'   \item{\code{supportsDynamicLegends}}{logical Supports dynamic legends}
#' }
"md_imap_index"

#' Maryland Open Data Portal Index
#'
#' Public resources from the Maryland Open Data Portal excluding resources
#' cross-listed from Maryland iMap.
#'
#' @format A data frame with 737 rows and 11 variables:
#' \describe{
#'   \item{\code{name}}{Resource name}
#'   \item{\code{nm}}{Resource name (snake case)}
#'   \item{\code{resource}}{Resource identifier}
#'   \item{\code{description}}{Description}
#'   \item{\code{url}}{Resource URL}
#'   \item{\code{issued}}{Date issued}
#'   \item{\code{modified}}{Date modified}
#'   \item{\code{keyword}}{list of keywords}
#'   \item{\code{identifier}}{API identifier}
#'   \item{\code{theme}}{Data theme}
#'   \item{\code{license}}{Data license}
#' }
"md_open_data_index"

#' Maryland Zoning District information
#'
#' An incomplete index of zoning district names and categories for Maryland
#' counties and local jurisdictions. Updated based on this Google Sheet:
#' <https://docs.google.com/spreadsheets/d/1qu8s3W9tvtMPvqLNpzrxqybqPSnl67aBBItSWRgbdto/edit?usp=sharing>
#'
#' @format A data frame with 112 rows and 15 variables:
#' \describe{
#'   \item{\code{zoning}}{Zoning (no hyphenation)}
#'   \item{\code{zoning_alt}}{Zoning (hyphenation)}
#'   \item{\code{name}}{Zoning district name}
#'   \item{\code{category}}{Zoning district category}
#'   \item{\code{district_type}}{Zoning district type}
#'   \item{\code{jurisdiction}}{Zoning jurisdiction}
#'   \item{\code{county}}{County}
#'   \item{\code{description}}{Description}
#'   \item{\code{year}}{Year active}
#'   \item{\code{lot_size_restriction}}{Numeric value of lot size restriction (if provided)}
#'   \item{\code{lot_size_units}}{Units for lot size restriction value}
#'   \item{\code{article}}{Article (for reference to code or ordinance)}
#'   \item{\code{page_num}}{Page number (for reference to code or ordinance)}
#'   \item{\code{overlay}}{Overlay district}
#'   \item{\code{repealed}}{Repealed zoning district name/type}
#' }
"md_zoning_info"

#' Maryland Metropolitan Planning Organizations (boundaries)
#'
#' Data from <https://geodata.md.gov/imap/rest/services/BusinessEconomy/MD_IncentiveZones/FeatureServer/14>
#'
#' @format A data frame with 7 rows and 6 variables:
#' \describe{
#'   \item{\code{geoid}}{GeoID}
#'   \item{\code{name}}{MPO Name}
#'   \item{\code{abb}}{MPO abbreviation or acronym}
#'   \item{\code{url}}{MPO website url}
#'   \item{\code{states}}{States (multiple states separated by semi-colons)}
#'   \item{\code{geometry}}{MULTIPOLYGON geometry for boundaries}
#' }
"md_mpos"

#' Maryland Public School Enrollment (SY 2003-2022)
#'
#' Enrollment data from the Maryland State Department of Education
#'  (MSDE). Raw CSV data files with the full state enrollment data are available
#'  in the \code{inst/extdata} folder. The number of enrolled students includes
#'  ungraded special education and pre-kindergarten students.
#'  Variable definitions are based on the \href{https://reportcard.msde.maryland.gov/Definitions/Index}{definitions from the MSDE website}.
#'
#' @format A data frame with 224,002 rows and 9 variables:
#' \describe{
#'  \item{\code{year}}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{\code{school_number}}{School number as integer (0 indicates all schools)}
#'  \item{\code{school_name}}{School name}
#'  \item{\code{enrolled_count}}{Number of students registered to attend the school at the start of the year in the grade or grade range. Typically enrollment count is as of September 30.}
#'  \item{\code{grade}}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{\code{grade_range}}{all elementary school Grades, all middle school grades, all high school grades, or
#'    all grades (total enrollment). May also be used as a label for grade.}
#'   \item{\code{race}}{Race/ethnicity. Enrollment by race/ethnicity is only available for years since 2020.}
#'   \item{\code{lss_number}}{Local school system number (previously known as a LEA Number).}
#'   \item{\code{lss_name}}{Local school system name (previously known as a LEA Name).}
#'  }
#' @source \href{https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload}{MSDE Data Downloads}
"msde_enrollment"

#' Maryland Public Schools
#'
#' Combined iMap FeatureLayer for traditional public schools and charter
#' schools. The school number very incomplete due to the iMap data using a
#' different school name than the MSDE data for a little less than half of
#' schools in the state.
#'
#' @format A data frame with 1,427 rows and 14 variables:
#' \describe{
#'   \item{\code{school_name}}{School name}
#'   \item{\code{address}}{Street address}
#'   \item{\code{city}}{City name}
#'   \item{\code{state}}{State}
#'   \item{\code{zip}}{Zip code}
#'   \item{\code{grades}}{Grades}
#'   \item{\code{school_type}}{School type}
#'   \item{\code{grade_band}}{Grade band}
#'   \item{\code{lss_number}}{Local school system number}
#'   \item{\code{psc_number}}{PSC number}
#'   \item{\code{county}}{County name}
#'   \item{\code{management_type}}{Management type}
#'   \item{\code{school_number}}{School number (incomplete)}
#'   \item{\code{geometry}}{POINT geometry}
#' }
"md_schools"

#' Maryland Senate Districts (2022)
#'
#' From the [Maryland Department of Planning](https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx): "The Maryland General Assembly,
#' under the Maryland Constitution, adopted new state legislative districts on
#' February 1, 2022, based on the changes in population reported in the 2020
#' U.S. Census and adjusted in accordance with Maryland's *No Representation
#' Without Population Act* of 2010."
#'
#' @format A data frame with 47 rows and 5 variables:
#' \describe{
#'   \item{\code{name}}{District name}
#'   \item{\code{id}}{District number}
#'   \item{\code{label}}{District label}
#'   \item{\code{pop}}{Population from 2020 U.S. Census}
#'   \item{\code{geometry}}{District boundary geometry}
#' }
#' @source \href{https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx}{2022 Maryland Legislative Districts}
"md_senate_districts_2022"

#' Maryland House of Delegates Districts (2022)
#'
#' From the [Maryland Department of Planning](https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx): "The Maryland General Assembly,
#' under the Maryland Constitution, adopted new state legislative districts on
#' February 1, 2022, based on the changes in population reported in the 2020
#' U.S. Census and adjusted in accordance with Maryland's *No Representation
#' Without Population Act* of 2010."
#'
#' @format A data frame with 71 rows and 6 variables:
#' \describe{
#'   \item{\code{name}}{District name}
#'   \item{\code{id}}{District number}
#'   \item{\code{label}}{District label}
#'   \item{\code{members}}{Number of Delegates for district}
#'   \item{\code{pop}}{Population from 2020 U.S. Census}
#'   \item{\code{geometry}}{District boundary geometry}
#' }
#' @source \href{https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx}{2022 Maryland Legislative Districts}
"md_house_districts_2022"
