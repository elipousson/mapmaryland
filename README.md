
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

Currently, the only feature in this package is a basic index of Maryland
ArcGIS services:

``` r
md_arcgis_index
#>                                                        name operator.abb
#> 1                                                      <NA>         <NA>
#> 2                                                      <NA>         <NA>
#> 3                                                      <NA>         <NA>
#> 4      GEOLOOM (Baltimore Neighborhood Indicators Alliance)         BNIA
#> 5                              Vital Signs Open Data Portal         BNIA
#> 6                                                      <NA>         BCIT
#> 7                                                      <NA>         <NA>
#> 8                                                 EGIS Data         BCIT
#> 9                                                  GIS Data         BCIT
#> 10                                                     <NA>         BCIT
#> 11                                                     <NA>          DPW
#> 12                                                     <NA>          DOT
#> 13                                                     <NA>         <NA>
#> 14                                                     <NA>         <NA>
#> 15                                   Baltimore DOT Planning          DOT
#> 16                         Baltimore City Police Department          BPD
#> 17                                                     <NA>         <NA>
#> 18                                                     <NA>         <NA>
#> 19                                                     <NA>         <NA>
#> 20                                                     <NA>         <NA>
#> 21           Metropolitan Washington Council of Governments         <NA>
#> 22   Washington Metropolitan Area Transit Authority (WMATA)        WMATA
#> 23                                                     WSSC         WSSC
#> 24                                                     <NA>         <NA>
#> 25                                                     <NA>         <NA>
#> 26                                                     <NA>         <NA>
#> 27                                                     <NA>         <NA>
#> 28                                                     <NA>         <NA>
#> 29                                                  MCATLAS         <NA>
#> 30                                                     <NA>         <NA>
#> 31                                                     <NA>         <NA>
#> 32                                                     <NA>         <NA>
#> 33                                                     <NA>         <NA>
#> 34                                                     <NA>         <NA>
#> 35                                                     <NA>         <NA>
#> 36                                                     <NA>         <NA>
#> 37                                                     <NA>         <NA>
#> 38 Montgomery County Department of Environmental Protection          DEP
#> 39                                                     <NA>         <NA>
#> 40                                                     <NA>         <NA>
#> 41                                                     <NA>         <NA>
#> 42                                                     <NA>         <NA>
#> 43                                                     <NA>         <NA>
#> 44                                                     <NA>         <NA>
#> 45                                                     <NA>         <NA>
#> 46                                                     <NA>         <NA>
#> 47                                                     <NA>         <NA>
#> 48                                       City of Hagerstown         <NA>
#> 49                     Baltimore Metropolitan Council (BMC)          BMC
#> 50                                Chesapeake Bay Foundation          CBF
#> 51                                   Chesapeake Bay Program         <NA>
#> 52                 Maryland Department of Natural Resources          DNR
#> 53                          Maryland Department of Planning          MDP
#> 54                   Maryland Department of the Environment          MDE
#> 55                    Maryland Department of Transportation         <NA>
#> 56   Maryland Food System Map – Center for a Livable Future         <NA>
#> 57                       Maryland Mapping & GIS Data Portal         <NA>
#> 58     University of Maryland - GIS and Spatial Data Center         <NA>
#> 59                                                     <NA>         <NA>
#> 60                                                     <NA>         <NA>
#> 61                                                     <NA>         <NA>
#> 62                                           Maryland LiDAR         <NA>
#> 63                        MD Park Equity Mapper Application         <NA>
#> 64                   Maryland Aviation Administration (MAA)          MAA
#> 65 Maryland Department of Housing and Community Development         DHCD
#> 66                                     Salisbury University         <NA>
#> 67                                                     <NA>          CBT
#>                                                      operator         city
#> 1                                                        <NA>         <NA>
#> 2                                                        <NA>         <NA>
#> 3                                                        <NA>         <NA>
#> 4                  Baltimore Neighborhood Indicators Alliance    Baltimore
#> 5           Baltimore Neighborhood Indicators Alliance (BNIA)    Baltimore
#> 6  Baltimore City Office of Information and Technology (BCIT)    Baltimore
#> 7                                                        <NA>    Baltimore
#> 8  Baltimore City Office of Information and Technology (BCIT)    Baltimore
#> 9  Baltimore City Office of Information and Technology (BCIT)    Baltimore
#> 10 Baltimore City Office of Information and Technology (BCIT)    Baltimore
#> 11                                 Department of Public Works    Baltimore
#> 12                                                       <NA>    Baltimore
#> 13                                                       <NA>    Baltimore
#> 14                                                       <NA>    Baltimore
#> 15                Baltimore City Department of Transportation    Baltimore
#> 16                                                       <NA>    Baltimore
#> 17                                                       <NA>         <NA>
#> 18                                                       <NA>         <NA>
#> 19                                                       <NA>         <NA>
#> 20                                                       <NA>         <NA>
#> 21                                                       <NA>   Washington
#> 22                                                       <NA>   Washington
#> 23                                                       <NA>   Washington
#> 24                                                       <NA>         <NA>
#> 25                                                       <NA>    Frederick
#> 26                                                       <NA>         <NA>
#> 27                                                       <NA>         <NA>
#> 28                                                       <NA>         <NA>
#> 29                      Montgomery County Planning Department         <NA>
#> 30                                                       <NA>         <NA>
#> 31                                                       <NA>         <NA>
#> 32                                                       <NA>         <NA>
#> 33                                                       <NA>         <NA>
#> 34                                                       <NA> Gaithersburg
#> 35                                                       <NA>    Rockville
#> 36                                                       <NA>         <NA>
#> 37                                                       <NA>         <NA>
#> 38   Montgomery County Department of Environmental Protection         <NA>
#> 39                                                       <NA>         <NA>
#> 40                                                       <NA>        Bowie
#> 41                                                       <NA>         <NA>
#> 42                                                       <NA>         <NA>
#> 43                                                       <NA>         <NA>
#> 44                                                       <NA>         <NA>
#> 45                                                       <NA>         <NA>
#> 46                                                       <NA>         <NA>
#> 47                                                       <NA>         <NA>
#> 48                                                       <NA>   Hagerstown
#> 49                             Baltimore Metropolitan Council    Baltimore
#> 50                                  Chesapeake Bay Foundation         <NA>
#> 51                                                       <NA>         <NA>
#> 52                                                       <NA>         <NA>
#> 53                                                       <NA>         <NA>
#> 54                                                       <NA>         <NA>
#> 55                                                       <NA>         <NA>
#> 56                          JHSPH Center for a Livable Future         <NA>
#> 57                                                    MD DoIT         <NA>
#> 58       University of Maryland - GIS and Spatial Data Center         <NA>
#> 59                                                       <NA>         <NA>
#> 60                                                       <NA>         <NA>
#> 61                                                       <NA>         <NA>
#> 62                                                       <NA>         <NA>
#> 63                                                       <NA>         <NA>
#> 64                           Maryland Aviation Administration         <NA>
#> 65                                                       <NA>         <NA>
#> 66                                                       <NA>         <NA>
#> 67                                       Chesapeake Bay Trust         <NA>
#>                    county                state state.abb              geography
#> 1         Allegany County             Maryland        MD             countywide
#> 2     Anne Arundel County             Maryland        MD             countywide
#> 3     Anne Arundel County             Maryland        MD             countywide
#> 4          Baltimore city             Maryland        MD               citywide
#> 5          Baltimore city             Maryland        MD               citywide
#> 6          Baltimore city             Maryland        MD               citywide
#> 7          Baltimore city             Maryland        MD               citywide
#> 8          Baltimore city             Maryland        MD               citywide
#> 9          Baltimore city             Maryland        MD               citywide
#> 10         Baltimore city             Maryland        MD               citywide
#> 11         Baltimore city             Maryland        MD               citywide
#> 12         Baltimore city             Maryland        MD               citywide
#> 13         Baltimore city             Maryland        MD               citywide
#> 14         Baltimore city             Maryland        MD               citywide
#> 15         Baltimore city             Maryland        MD               citywide
#> 16         Baltimore city             Maryland        MD               citywide
#> 17       Baltimore County             Maryland        MD             countywide
#> 18         Calvert County             Maryland        MD             countywide
#> 19           Cecil County             Maryland        MD             countywide
#> 20           Cecil County             Maryland        MD             countywide
#> 21   District of Columbia District of Columbia        DC regional (multicounty)
#> 22   District of Columbia District of Columbia        DC  regional (multistate)
#> 23   District of Columbia District of Columbia        DC  regional (multistate)
#> 24       Frederick County             Maryland        MD             countywide
#> 25       Frederick County             Maryland        MD               citywide
#> 26         Garrett County             Maryland        MD             countywide
#> 27         Harford County             Maryland        MD             countywide
#> 28          Howard County             Maryland        MD             countywide
#> 29      Montgomery County             Maryland        MD             countywide
#> 30      Montgomery County             Maryland        MD             countywide
#> 31      Montgomery County             Maryland        MD             countywide
#> 32      Montgomery County             Maryland        MD             countywide
#> 33      Montgomery County             Maryland        MD             countywide
#> 34      Montgomery County             Maryland        MD               citywide
#> 35      Montgomery County             Maryland        MD               citywide
#> 36      Montgomery County             Maryland        MD             countywide
#> 37      Montgomery County             Maryland        MD             countywide
#> 38      Montgomery County             Maryland        MD             countywide
#> 39 Prince George's County             Maryland        MD             countywide
#> 40 Prince George’s County             Maryland        MD               citywide
#> 41 Prince George’s County             Maryland        MD             countywide
#> 42 Prince George’s County             Maryland        MD             countywide
#> 43    Queen Anne’s County             Maryland        MD             countywide
#> 44    Queen Anne’s County             Maryland        MD             countywide
#> 45      St. Mary’s County             Maryland        MD             countywide
#> 46          Talbot County             Maryland        MD             countywide
#> 47      Washington County             Maryland        MD             countywide
#> 48      Washington County             Maryland        MD               citywide
#> 49                   <NA>             Maryland        MD regional (multicounty)
#> 50                   <NA>             Maryland        MD  regional (multistate)
#> 51                   <NA>             Maryland        MD  regional (multistate)
#> 52                   <NA>             Maryland        MD              statewide
#> 53                   <NA>             Maryland        MD              statewide
#> 54                   <NA>             Maryland        MD              statewide
#> 55                   <NA>             Maryland        MD              statewide
#> 56                   <NA>             Maryland        MD              statewide
#> 57                   <NA>             Maryland        MD              statewide
#> 58                   <NA>             Maryland        MD              statewide
#> 59                   <NA>             Maryland        MD              statewide
#> 60                   <NA>             Maryland        MD              statewide
#> 61                   <NA>             Maryland        MD              statewide
#> 62                   <NA>             Maryland        MD              statewide
#> 63                   <NA>             Maryland        MD              statewide
#> 64                   <NA>             Maryland        MD              statewide
#> 65                   <NA>             Maryland        MD              statewide
#> 66                   <NA>             Maryland        MD              statewide
#> 67                   <NA>                 <NA>        MD  regional (multistate)
#>           source_type
#> 1   county government
#> 2   county government
#> 3   county government
#> 4          university
#> 5          university
#> 6     city government
#> 7     city government
#> 8     city government
#> 9     city government
#> 10    city government
#> 11        city agency
#> 12        city agency
#> 13    city government
#> 14    city government
#> 15    city government
#> 16       state agency
#> 17  county government
#> 18  county government
#> 19  county government
#> 20  county government
#> 21    regional agency
#> 22    regional agency
#> 23    regional agency
#> 24  county government
#> 25    city government
#> 26  county government
#> 27  county government
#> 28  county government
#> 29      county agency
#> 30  county government
#> 31  county government
#> 32  county government
#> 33  county government
#> 34    city government
#> 35    city government
#> 36  county government
#> 37  county government
#> 38      county agency
#> 39  county government
#> 40    city government
#> 41  county government
#> 42  county government
#> 43  county government
#> 44  county government
#> 45  county government
#> 46  county government
#> 47  county government
#> 48    city government
#> 49    regional agency
#> 50               <NA>
#> 51               <NA>
#> 52       state agency
#> 53       state agency
#> 54       state agency
#> 55       state agency
#> 56 private university
#> 57   state government
#> 58         university
#> 59   state government
#> 60   state government
#> 61   state government
#> 62   state government
#> 63         university
#> 64       state agency
#> 65       state agency
#> 66         university
#> 67               <NA>
#>                                                                                                                                      notes
#> 1                                                                                                                                     <NA>
#> 2                                                                                                                                     <NA>
#> 3                                                                                                                                     <NA>
#> 4                                                         Project specific server but includes overlapping data w/ other BNIA data portals
#> 5                                                                                                                                     <NA>
#> 6                                                                                                                                     <NA>
#> 7                                                                                                                                     <NA>
#> 8                                                                                                  Used for Baltimore City CoDeMap website
#> 9                                                                                                                                     <NA>
#> 10                                                                                                                                    <NA>
#> 11                                                                                                                                    <NA>
#> 12                                                                                                                                    <NA>
#> 13                                                                                                                                    <NA>
#> 14                                                                               Used by baltimore_forestry ArcGIS user account and others
#> 15                                                                                                                                    <NA>
#> 16                                                                                                                                    <NA>
#> 17                                                                                                                                    <NA>
#> 18                                                                                                                                    <NA>
#> 19                                                                                                                                    <NA>
#> 20                                                                                                                                    <NA>
#> 21                                                                                                                                    <NA>
#> 22                                                                                                 Also known as "DC Metro" or "The Metro"
#> 23                                                                                                                                    <NA>
#> 24                                                                                                                                    <NA>
#> 25                                                                                                                                    <NA>
#> 26                                                                                                                                    <NA>
#> 27                                                                                                                                    <NA>
#> 28                                                                                                                                    <NA>
#> 29                                                                                                                                    <NA>
#> 30                                                                                                                                    <NA>
#> 31                                                                                                                                    <NA>
#> 32                                                                                                                                    <NA>
#> 33                                                                                                                                    <NA>
#> 34                                                                                                                                    <NA>
#> 35                                                                                                                                    <NA>
#> 36                                                                                                                                    <NA>
#> 37                                                                                                                                    <NA>
#> 38                                                                                                                                    <NA>
#> 39                                                                                                                                    <NA>
#> 40                                                                                                                                    <NA>
#> 41                                                                                                                                    <NA>
#> 42                                                                                                                                    <NA>
#> 43                                                                                                                                    <NA>
#> 44                                                                                                                                    <NA>
#> 45                                                                                                                                    <NA>
#> 46                                                                                                                                    <NA>
#> 47 No longer restricted as of March 2022; previously restricted access in Dec. 2021; previously publicly accessible recently as Sept. 2021
#> 48                                                                                                                                    <NA>
#> 49                                                                                                                                    <NA>
#> 50                                     Foundation works regionally including MD, PA, VA and DE (?) - should it include a state name + abb?
#> 51                                                                                                                                    <NA>
#> 52                                                                                                                                    <NA>
#> 53                                                                                                                                    <NA>
#> 54                                                                                                                                    <NA>
#> 55                                                                                                                                    <NA>
#> 56                                                                                                                                    <NA>
#> 57                                                                                                                                    <NA>
#> 58                                                                                                                                    <NA>
#> 59                                                                                                                                    <NA>
#> 60                                                                                                                                    <NA>
#> 61                                                                                                                                    <NA>
#> 62                                                                                                               Formerly managed by ESRGC
#> 63                                                                                            Server for MD Park Equity Mapper Application
#> 64                                                                                                                          Managed by JMT
#> 65                                                                                                               Expired HTTPS certificate
#> 66                                                      Includes statewide environmental data sources and university-specific data sources
#> 67                                                                                                                                    <NA>
#>    public
#> 1    TRUE
#> 2    TRUE
#> 3    TRUE
#> 4    TRUE
#> 5    TRUE
#> 6    TRUE
#> 7    TRUE
#> 8    TRUE
#> 9    TRUE
#> 10   TRUE
#> 11   TRUE
#> 12   TRUE
#> 13   TRUE
#> 14   TRUE
#> 15   TRUE
#> 16   TRUE
#> 17   TRUE
#> 18   TRUE
#> 19   TRUE
#> 20   TRUE
#> 21   TRUE
#> 22   TRUE
#> 23   TRUE
#> 24   TRUE
#> 25   TRUE
#> 26   TRUE
#> 27   TRUE
#> 28   TRUE
#> 29   TRUE
#> 30   TRUE
#> 31   TRUE
#> 32   TRUE
#> 33   TRUE
#> 34   TRUE
#> 35   TRUE
#> 36   TRUE
#> 37   TRUE
#> 38   TRUE
#> 39   TRUE
#> 40   TRUE
#> 41   TRUE
#> 42   TRUE
#> 43   TRUE
#> 44   TRUE
#> 45   TRUE
#> 46   TRUE
#> 47   TRUE
#> 48   TRUE
#> 49   TRUE
#> 50   TRUE
#> 51   TRUE
#> 52   TRUE
#> 53   TRUE
#> 54   TRUE
#> 55   TRUE
#> 56   TRUE
#> 57   TRUE
#> 58   TRUE
#> 59   TRUE
#> 60   TRUE
#> 61   TRUE
#> 62   TRUE
#> 63   TRUE
#> 64   TRUE
#> 65   TRUE
#> 66   TRUE
#> 67   TRUE
#>                                                                                       services_url
#> 1                                          https://alleganygis.allconet.org/allcogis/rest/services
#> 2                                                    https://gis.aacounty.org/arcgis/rest/services
#> 3                                                     https://gis.aacounty.org/image/rest/services
#> 4                              https://services1.arcgis.com/mVFRs7NF4iFitgbY/arcgis/rest/services/
#> 5                              https://services1.arcgis.com/mVFRs7NF4iFitgbY/arcgis/rest/services/
#> 6                                                 https://gis.baltimorecity.gov/egis/rest/services
#> 7                                           https://opendata.baltimorecity.gov/egis/rest/services/
#> 8                                           https://egisdata.baltimorecity.gov/egis/rest/services/
#> 9                                            https://gisdata.baltimorecity.gov/egis/rest/services/
#> 10                                           https://geodata.baltimorecity.gov/egis/rest/services/
#> 11                                          https://dpwgis.baltimorecity.gov/ags102/rest/services/
#> 12                                          https://dotgis.baltimorecity.gov/arcgis/rest/services/
#> 13                             https://services1.arcgis.com/43Lm3JYE3nM91DAF/ArcGIS/rest/services/
#> 14                              https://services1.arcgis.com/UWYHeuuJISiGmgXx/ArcGIS/rest/services
#> 15                             https://services3.arcgis.com/ZTvQ9NuONePFYofE/ArcGIS/rest/services/
#> 16                                      https://arcgisportal.baltimorepolice.org/gis/rest/services
#> 17                                        https://bcgis.baltimorecountymd.gov/arcgis/rest/services
#> 18                                            https://gis.calvertcountymd.gov/server/rest/services
#> 19 https://services3.arcgis.com/nJbIFHiSnaX0z0hS/ArcGIS/rest/services/Cecil_DamgAsmt/FeatureServer
#> 20                                                     https://cecilmaps.org/arcgis/rest/services/
#> 21                                                         https://gis.mwcog.org/wa/rest/services/
#> 22                                  https://gisservices.wmata.com/gisservices/rest/services/Public
#> 23                                                 https://gis.wsscwater.com/arcgis/rest/services/
#> 24                                         https://maps.frederickcountymd.gov/arcgis/rest/services
#> 25                                         https://spires.cityoffrederick.com/ArcGIS/rest/services
#> 26                                             https://maps.garrettcounty.org/arcweb/rest/services
#> 27                                         https://hcggis.harfordcountymd.gov/public/rest/services
#> 28 https://data.howardcountymd.gov/geoserver/ows?service=wms&version=1.1.1&request=GetCapabilities
#> 29                                                      https://mcatlas.org/arcgis3/rest/services/
#> 30                                         https://gis.montgomerycountymd.gov/ArcGIS/rest/services
#> 31                                        https://gis2.montgomerycountymd.gov/arcgis/rest/services
#> 32                                        https://gis3.montgomerycountymd.gov/arcgis/rest/services
#> 33                                        https://gis4.montgomerycountymd.gov/arcgis/rest/services
#> 34                                            https://maps.gaithersburgmd.gov/arcgis/rest/services
#> 35                                               https://maps.rockvillemd.gov/arcgis/rest/services
#> 36                                                       https://mcatlas.org/arcgis3/rest/services
#> 37                                        https://www7.montgomerycountymd.gov/arcgis/rest/services
#> 38                                     https://depgis.montgomerycountymd.gov/arcgis/rest/services/
#> 39                                                  https://gis.pgatlas.com/pgatlas/rest/services/
#> 40                                                https://gis.cityofbowie.org/arcgis/rest/services
#> 41                                             https://gisdata.pgplanning.org/arcgis/rest/services
#> 42                                https://onlinegis.princegeorgescountymd.gov/arcgis/rest/services
#> 43                                                        https://gis.qac.org/arcgis/rest/services
#> 44  https://services3.arcgis.com/nJbIFHiSnaX0z0hS/ArcGIS/rest/services/QA_WaterSewer/FeatureServer
#> 45                                               https://stmgis.stmarysmd.com/arcgis/rest/services
#> 46                                                    http://maps.talbgov.org/arcgis/rest/services
#> 47                                                 https://maps.washco-md.net/arcgis/rest/services
#> 48                                           https://citymap.hagerstownmd.org/server/rest/services
#> 49                                                 https://gis.baltometro.org/arcgis/rest/services
#> 50                                                       https://gis.cbf.org/arcgis/rest/services/
#> 51                                                         https://gis.chesapeakebay.net/ags/rest/
#> 52                                           https://gisapps.dnr.state.md.us/arcgis2/rest/services
#> 53                                             https://mdpgis.mdp.state.md.us/arcgis/rest/services
#> 54                                           https://mdewin64.mde.state.md.us/arcgis/rest/services
#> 55                                            https://maps.roads.maryland.gov/arcgis/rest/services
#> 56                                            https://gis.mdfoodsystemmap.org/server/rest/services
#> 57                                                       https://geodata.md.gov/imap/rest/services
#> 58                                                       https://maps.umd.edu/arcgis/rest/services
#> 59                                               https://archive.geodata.md.gov/imap/rest/services
#> 60                                                    https://geodata.md.gov/appdata/rest/services
#> 61                                               https://imagery.geodata.md.gov/imap/rest/services
#> 62                                                 https://lidar.geodata.md.gov/imap/rest/services
#> 63                                                    https://p1.cgis.umd.edu/arcgis/rest/services
#> 64                                               https://airportal-ol.jmt.com/arcgis/rest/services
#> 65                                         https://www2.dhcd.state.md.us:6443/arcgis/rest/services
#> 66                                          https://geoservices.salisbury.edu/arcgis/rest/services
#> 67                                               https://gis.chesapeakebay.net/server/rest/service
#>          hosting
#> 1           <NA>
#> 2           <NA>
#> 3           <NA>
#> 4  ArcGIS Online
#> 5  ArcGIS Online
#> 6           <NA>
#> 7           <NA>
#> 8           <NA>
#> 9           <NA>
#> 10          <NA>
#> 11          <NA>
#> 12          <NA>
#> 13 ArcGIS Online
#> 14 ArcGIS Online
#> 15 ArcGIS Online
#> 16          <NA>
#> 17          <NA>
#> 18          <NA>
#> 19 ArcGIS Online
#> 20          <NA>
#> 21          <NA>
#> 22          <NA>
#> 23          <NA>
#> 24          <NA>
#> 25          <NA>
#> 26          <NA>
#> 27          <NA>
#> 28          <NA>
#> 29          <NA>
#> 30          <NA>
#> 31          <NA>
#> 32          <NA>
#> 33          <NA>
#> 34          <NA>
#> 35          <NA>
#> 36          <NA>
#> 37          <NA>
#> 38          <NA>
#> 39          <NA>
#> 40          <NA>
#> 41          <NA>
#> 42          <NA>
#> 43          <NA>
#> 44 ArcGIS Online
#> 45          <NA>
#> 46          <NA>
#> 47          <NA>
#> 48          <NA>
#> 49          <NA>
#> 50          <NA>
#> 51          <NA>
#> 52          <NA>
#> 53          <NA>
#> 54          <NA>
#> 55          <NA>
#> 56          <NA>
#> 57          <NA>
#> 58          <NA>
#> 59          <NA>
#> 60          <NA>
#> 61          <NA>
#> 62          <NA>
#> 63          <NA>
#> 64          <NA>
#> 65          <NA>
#> 66          <NA>
#> 67          <NA>
```
