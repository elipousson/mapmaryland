#' Maryland ArcGIS REST API Services Index
#'
#' A non-comprehensive list of ArcGIS services maintained by public agencies,
#' academic units, and nonprofit organizations in Maryland. Layers available at
#' the service_url can be accessed using the [{esri2sf}
#' package](https://github.com/elipousson/esri2sf).
#'
#' Comments, additions,
#' or corrections can be submitted using comments on this open Google Sheet:
#' <https://docs.google.com/spreadsheets/d/1c829bZdNqvbpoizulBU_XE5jVeNNck2kHkS-smpQ52s/edit?usp=sharing>
#'
#' Data last updated from Google Sheet 2024-09-18.
#'
#' @format A data frame with 95 rows and 13 variables:
#' \describe{
#'   \item{`name`}{character Source name}
#'   \item{`operator.abb`}{character Operator abbreviation}
#'   \item{`operator`}{character Operator name}
#'   \item{`city`}{character City name}
#'   \item{`county`}{character County name}
#'   \item{`state`}{character State name}
#'   \item{`state.abb`}{character State name abbreviation}
#'   \item{`geography`}{character Geographic scope; Options include
#'   citywide, countywide, regional (multi-county), statewide, or regional
#'   (multistate).}
#'   \item{`source_type`}{character Source type}
#'   \item{`notes`}{character Notes}
#'   \item{`public`}{logical Public data indicator}
#'   \item{`services_url`}{character Services URL}
#'   \item{`hosting`}{character Hosting type; Currently used as an
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
#'   \item{`statefp`}{State FIPS code for Maryland}
#'   \item{`countyfp`}{County FIPS code}
#'   \item{`countyns`}{County GNIS code}
#'   \item{`geoid`}{Unique county FIPS code (concatenation of state and county FIPS codes)}
#'   \item{`name`}{County name}
#'   \item{`namelsad`}{Concatenated variable length geographic area name and
#'   legal/statistical area description (LSAD)}
#'   \item{`lsad`}{Legal/statistical area description (LSAD)}
#'   \item{`classfp`}{FIPS class code}
#'   \item{`mtfcc`}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{`csafp`}{Combined statistical area code}
#'   \item{`cbsafp`}{Metropolitan statistical area/micropolitan statistical area code}
#'   \item{`metdivfp`}{Metropolitan division code}
#'   \item{`funcstat`}{Functional status}
#'   \item{`aland`}{Land area (square meters)}
#'   \item{`awater`}{Water area (square meters)}
#'   \item{`intptlat`}{Latitude of the internal point}
#'   \item{`intptlon`}{Longitude of the internal point}
#'   \item{`region`}{Region of the state}
#'   \item{`geometry`}{Multipolygon with the county boundary}
#' }
#' @source <https://www.census.gov/geo/maps-data/data/tiger-line.html>
"md_counties"


#' Maryland Counties (detailed boundaries)
#'
#' Detailed boundaries for Maryland counties from Maryland iMap.
#'
#' @format A data frame with 24 rows and 6 variables:
#' \describe{
#'   \item{`statefp`}{State FIPS code for Maryland}
#'   \item{`countyfp`}{County FIPS code}
#'   \item{`name`}{County name}
#'   \item{`geoid`}{Unique county GeoID (concatenation of state and county FIPS codes)}
#'   \item{`namelsad`}{Concatenated variable length geographic area name and legal/statistical area description (LSAD)}
#'   \item{`geometry`}{Multipolygon with the county boundary}
#' }
"md_counties_detailed"


#' Maryland Census-designated places
#'
#' Census Designated Places (CDPs) in the state of Maryland downloaded using the
#' [tigris::places] function.
#'
#' @format A data frame with 536 rows and 17 variables:
#' \describe{
#'   \item{`statefp`}{State FIPS code for Maryland}
#'   \item{`county`}{County name}
#'   \item{`countyfp`}{County FIPS code}
#'   \item{`placefp`}{CDP FIPS code}
#'   \item{`placens`}{CDP GNIS code}
#'   \item{`geoid`}{Unique CDP GeoID}
#'   \item{`name`}{Place name}
#'   \item{`namelsad`}{Place Legal/statistical area description (LSAD)}
#'   \item{`lsad`}{Legal/statistical area description (LSAD)}
#'   \item{`classfp`}{Class FIPS code}
#'   \item{`pcicbsa`}{Current metropolitan/micropolitan statistical area principal city indicator}
#'   \item{`mtfcc`}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{`funcstat`}{Functional status}
#'   \item{`aland`}{Land area (square meters)}
#'   \item{`awater`}{Water area (square meters)}
#'   \item{`intptlat`}{Latitude of the internal point}
#'   \item{`intptlon`}{Longitude of the internal point}
#'   \item{`geometry`}{list COLUMN_DESCRIPTION}
#' }
"md_census_places"


#' Maryland U.S. Congressional Districts
#'
#' U.S. Congressional Districts boundaries downloaded from the U.S. Census Bureau with the
#' [tigris::congressional_districts] function.
#'
#' @format A data frame with 8 rows and 13 variables:
#' \describe{
#'   \item{`statefp`}{2-character state FIPS code}
#'   \item{`cd116fp`}{116th congressional district FIPS code}
#'   \item{`geoid`}{GeoID}
#'   \item{`namelsad`}{concatenated variable with geographic area name and legal/statistical area description (LSAD)}
#'   \item{`lsad`}{Legal/statistical area description (LSAD)}
#'   \item{`cdsessn`}{Congressional session code}
#'   \item{`mtfcc`}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{`funcstat`}{functional status}
#'   \item{`aland`}{land area (square meters)}
#'   \item{`awater`}{water area (square meters)}
#'   \item{`intptlat`}{latitude of the internal point}
#'   \item{`intptlon`}{longitude of the internal point}
#'   \item{`label`}{Congressional District label}
#'   \item{`name`}{Congressional District name}
#'   \item{`geometry`}{Multipolygon with district boundary}
#' }
"md_congressional_districts"

#' U.S. States (near Maryland)
#'
#' U.S. states bordering Maryland or in close proximity.
#'
#' @format A data frame with 7 rows and 15 variables:
#' \describe{
#'   \item{`region`}{character Region ID}
#'   \item{`division`}{character Division ID}
#'   \item{`statefp`}{2-character state FIPS code}
#'   \item{`statens`}{character State National Standard (NS) identifier using U.S. Geological Survey’s Geographic Names Information System (GNIS) code}
#'   \item{`geoid`}{character GeoID}
#'   \item{`stusps`}{character State U.S. Postal Service abbreviation}
#'   \item{`name`}{character State name}
#'   \item{`lsad`}{Legal/statistical area description (LSAD)}
#'   \item{`mtfcc`}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{`funcstat`}{functional status}
#'   \item{`aland`}{land area (square meters)}
#'   \item{`awater`}{water area (square meters)}
#'   \item{`intptlat`}{latitude of the internal point}
#'   \item{`intptlon`}{longitude of the internal point}
#'   \item{`geometry`}{list Geometry}
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
#'   \item{`ansicode`}{character ANSI code}
#'   \item{`hydroid`}{character Hydroid}
#'   \item{`fullname`}{character Full name}
#'   \item{`mtfcc`}{character MAF/TIGER Feature Class Code}
#'   \item{`aland`}{double Land area}
#'   \item{`awater`}{double Water area}
#'   \item{`intptlat`}{character Interior latitude point}
#'   \item{`intptlon`}{character Interior longitude point}
#'   \item{`geometry`}{list Multipolygon geometry}
#' }
#' @source <https://data.imap.maryland.gov/datasets/maryland-waterbodies-rivers-and-streams-detailed>
"md_water"

#' Maryland Real Property Assessments (fields reference)
#'
#' @format A data frame with 223 rows and 6 variables:
#' \describe{
#'   \item{`field_order`}{Field order}
#'   \item{`field_name`}{Field name}
#'   \item{`data_type`}{Data type}
#'   \item{`mdp_field_name`}{Maryland Department of Planning (MDP) Field name}
#'   \item{`api_field_name`}{Maryland Open Data portal API field name}
#'   \item{`sdat_field_number`}{State Department of Assessments and Taxation (SDAT) field number}
#' }
#' @source <https://opendata.maryland.gov/Business-and-Economy/Maryland-Real-Property-Assessments-Fields-Referenc/w8th-47fz/data>
"real_property_cols"

#' Maryland iMap Folder/Service Index
#'
#' Created using esriIndex function from the esri2sf package. Updated 2024-09-18.
#'
#' @format A data frame with 1,524 rows and 16 variables:
#' \describe{
#'   \item{`name`}{character Name}
#'   \item{`nm`}{character Name with snake case}
#'   \item{`type`}{character Service/layer type}
#'   \item{`url`}{character Folder/service/layer URL}
#'   \item{`urlType`}{character Index type}
#'   \item{`folderPath`}{Folder path}
#'   \item{`serviceName`}{character Service/layer type}
#'   \item{`serviceType`}{character Service/layer type}
#'   \item{`id`}{integer Layer ID number}
#'   \item{`parentLayerId`}{integer Parent layer ID number}
#'   \item{`defaultVisibility`}{logical Layer default visibility}
#'   \item{`minScale`}{double Minimum scale}
#'   \item{`maxScale`}{integer Maximum scale}
#'   \item{`geometryType`}{character Geometry type}
#'   \item{`subLayerIds`}{list Sublayer ID numbers}
#'   \item{`supportsDynamicLegends`}{logical Supports dynamic legends}
#' }
"md_imap_index"

#' Maryland Open Data Portal Index
#'
#' Public resources from the Maryland Open Data Portal excluding resources
#' cross-listed from Maryland iMap.
#'
#' @format A data frame with 737 rows and 11 variables:
#' \describe{
#'   \item{`name`}{Resource name}
#'   \item{`nm`}{Resource name (snake case)}
#'   \item{`resource`}{Resource identifier}
#'   \item{`description`}{Description}
#'   \item{`url`}{Resource URL}
#'   \item{`issued`}{Date issued}
#'   \item{`modified`}{Date modified}
#'   \item{`keyword`}{list of keywords}
#'   \item{`identifier`}{API identifier}
#'   \item{`theme`}{Data theme}
#'   \item{`license`}{Data license}
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
#'   \item{`zoning`}{Zoning (no hyphenation)}
#'   \item{`zoning_alt`}{Zoning (hyphenation)}
#'   \item{`name`}{Zoning district name}
#'   \item{`category`}{Zoning district category}
#'   \item{`district_type`}{Zoning district type}
#'   \item{`jurisdiction`}{Zoning jurisdiction}
#'   \item{`county`}{County}
#'   \item{`description`}{Description}
#'   \item{`year`}{Year active}
#'   \item{`lot_size_restriction`}{Numeric value of lot size restriction (if provided)}
#'   \item{`lot_size_units`}{Units for lot size restriction value}
#'   \item{`article`}{Article (for reference to code or ordinance)}
#'   \item{`page_num`}{Page number (for reference to code or ordinance)}
#'   \item{`overlay`}{Overlay district}
#'   \item{`repealed`}{Repealed zoning district name/type}
#' }
"md_zoning_info"

#' Maryland Metropolitan Planning Organizations (boundaries)
#'
#' Data from <https://geodata.md.gov/imap/rest/services/BusinessEconomy/MD_IncentiveZones/FeatureServer/14>
#'
#' @format A data frame with 7 rows and 6 variables:
#' \describe{
#'   \item{`geoid`}{GeoID}
#'   \item{`name`}{MPO Name}
#'   \item{`abb`}{MPO abbreviation or acronym}
#'   \item{`url`}{MPO website url}
#'   \item{`states`}{States (multiple states separated by semi-colons)}
#'   \item{`geometry`}{MULTIPOLYGON geometry for boundaries}
#' }
"md_mpos"

#' Maryland Public School Enrollment (SY 2003-2022)
#'
#' Enrollment data from the Maryland State Department of Education (MSDE). This
#' data is copied from the
#' [marylandedu](https://github.com/elipousson/marylandedu) R data package.
#' Refer to that package for more detailed documentation. Variable definitions
#' are based on the [definitions from the MSDE
#' website](https://reportcard.msde.maryland.gov/Definitions/Index).
#'
#' @format A data frame with 219,741 rows and 10 variables:
#' \describe{
#'  \item{`year`}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{`school_number`}{School number as integer (0 indicates all
#'  schools)}
#'  \item{`school_name`}{School name}
#'  \item{`enrolled_count`}{Number of students registered to attend the
#'  school at the start of the year in the grade or grade range as integer.
#'  Typically enrollment count is as of September 30.}
#'  \item{`grade`}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{`grade_range`}{all elementary school Grades, all middle school
#'  grades, all high school grades, or all grades (total enrollment). May also
#'  be used as a label for grade.}
#'   \item{`race`}{Race/ethnicity. Enrollment by race/ethnicity is only
#'   available across all grades for years since 2020. "All" is used for data
#'   prior to 2020.}
#'   \item{`date_created`}{Date record created.}
#'   \item{`lss_number`}{Local school system (LSS) number as integer. NA is used
#'   in place of a LSS number for statewide data. Older LEA numbers are combined
#'   with LSS numbers in this dataset.}
#'   \item{`lss_name`}{Local school system (LSS) names (typically same as county
#'   name). "State" is used in place of a LSS name for statewide data. Older LEA
#'   names are combined with LSS names in this dataset.}
#'  }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"msde_enrollment"

#' Maryland K-12 Schools (Public and Charter Schools)
#'
#' Combined iMap FeatureLayer for traditional public schools and charter
#' schools. The school number previously included in this dataset was incomplete
#' due to the iMap data using a different school name than the MSDE data for a
#' little less than half of schools in the state. As of February 2023, the
#' school number column has been removed to ensure the data is accurate and to
#' avoid confusion. For charter schools, the school_type column has been added
#' based on the grade range. Data based on iMap data layers as of 2023 February
#' 10 for public schools
#' <https://geodata.md.gov/imap/rest/services/Education/MD_EducationFacilities/FeatureServer/5>
#' and charter schools
#' <https://geodata.md.gov/imap/rest/services/Education/MD_EducationFacilities/FeatureServer/6>
#'
#' @format A data frame with 1,427 rows and 13 variables:
#' \describe{
#'   \item{`school_name`}{School name}
#'   \item{`address`}{Street address}
#'   \item{`city`}{City name}
#'   \item{`state`}{State}
#'   \item{`zip`}{Zip code}
#'   \item{`grades`}{Grades}
#'   \item{`school_type`}{School type}
#'   \item{`grade_band`}{Grade band}
#'   \item{`psc_number`}{PSC number}
#'   \item{`lss_number`}{Local school system number as integer}
#'   \item{`county`}{County name}
#'   \item{`management_type`}{Management type}
#'   \item{`geometry`}{POINT geometry}
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
#'   \item{`name`}{District name}
#'   \item{`id`}{District number}
#'   \item{`label`}{District label}
#'   \item{`pop`}{Population from 2020 U.S. Census}
#'   \item{`geometry`}{District boundary geometry}
#' }
#' @source [2022 Maryland Legislative Districts](https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx)
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
#'   \item{`name`}{District name}
#'   \item{`id`}{District number}
#'   \item{`label`}{District label}
#'   \item{`members`}{Number of Delegates for district}
#'   \item{`pop`}{Population from 2020 U.S. Census}
#'   \item{`geometry`}{District boundary geometry}
#' }
#' @source [2022 Maryland Legislative Districts](https://planning.maryland.gov/Redistricting/Pages/2020/legiDist.aspx)
"md_house_districts_2022"


#' Maryland Zip Code Tabulation Areas (ZCTA) - 2020
#'
#' ZIP Code Tabulation Areas (ZCTAs) are generalized areal representations of
#' United States Postal Service (USPS) ZIP Code service areas downloaded using
#' the [tigris::zctas()] function.
#'
#' @format A data frame with 478 rows and 10 variables:
#' \describe{
#'   \item{`zcta5ce20`}{ZCTA identifier}
#'   \item{`geoid20`}{ZCTA GeoID}
#'   \item{`classfp20`}{FIPS class code}
#'   \item{`mtfcc20`}{MAF/TIGER Feature Class Code (MTFCC)}
#'   \item{`funcstat20`}{Functional status}
#'   \item{`aland20`}{Land area (square meters)}
#'   \item{`awater20`}{Water area (square meters)}
#'   \item{`intptlat20`}{Latitude of the internal point}
#'   \item{`intptlon20`}{Longitude of the internal point}
#'   \item{`geometry`}{Multipolygon with the ZCTA boundary}
#' }
#' @source <https://www.census.gov/programs-surveys/geography/guidance/geo-areas/zctas.html>
"md_zctas"


#' Maryland Arts & Entertainment Districts
#'
#' The Maryland State Arts Council sponsors Arts & Entertainment Districts as a
#' way to stimulate the economy and improve quality of life. This legislation
#' enables local jurisdictions, municipalities, counties, or a combination
#' thereof, to apply for state designations for the Arts and Entertainment
#' Districts within their boundaries and offer tax incentives as provided by
#' law. More information from the Maryland State Arts Council:
#' <https://msac.org/programs/arts-entertainment-districts>
#'
#' @format A data frame with 29 rows and 12 variables:
#' \describe{
#'   \item{`name`}{District name}
#'   \item{`desc`}{District description}
#'   \item{`org_name`}{Organization name}
#'   \item{`org_url`}{Organization website URL}
#'   \item{`org_phone`}{Organization phone number}
#'   \item{`org_address`}{Organization street address}
#'   \item{`org_city`}{Organization city}
#'   \item{`org_county`}{Organization county}
#'   \item{`zipcode`}{Organization zipcode}
#'   \item{`lon`}{Longitude}
#'   \item{`lat`}{Latitude}
#'   \item{`geometry`}{MULTIPOLYGON geometry with boundaries}
#'}
#' @source <https://geodata.md.gov/imap/rest/services/BusinessEconomy/MD_IncentiveZones/FeatureServer/2>
"md_arts_districts"
