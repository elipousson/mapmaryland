#' Maryland ArcGIS REST API Services Index
#'
#' A non-comprehensive list of ArcGIS services maintained by public agencies,
#' academic units, and nonprofit organizations in Maryland. Comments, additions,
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
#'   citywide, countywide, regional (multicounty), statewide, or regional
#'   (multistate).}
#'   \item{\code{source_type}}{character Source type}
#'   \item{\code{notes}}{character Notes}
#'   \item{\code{public}}{logical Public data indicator}
#'   \item{\code{services_url}}{character Services URL}
#'   \item{\code{hosting}}{character Hosting type; Currently used as an
#'   indicator for ArcGIS Online hosted data with other services assumed to be
#'   self-hosted by the source or operator.}
#'}
#' @details DETAILS
"md_arcgis_index"
