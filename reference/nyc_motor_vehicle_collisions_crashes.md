# Motor Vehicle Collisions - Crashes

Downloads Motor Vehicle Collisions - Crashes data from NYC Open Data.

## Usage

``` r
nyc_motor_vehicle_collisions_crashes(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Motor Vehicle Collisions - Crashes data.

## Details

The Motor Vehicle Collisions crash table contains details on the crash
event. Each row represents a crash event. The Motor Vehicle Collisions
data tables contain information from all police reported motor vehicle
collisions in NYC. The police report (MV104-AN) is required to be filled
out for collisions where someone is injured or killed, or where there is
at least \$1000 worth of damage
(https://www.nhtsa.gov/sites/nhtsa.dot.gov/files/documents/ny_overlay_mv-104an_rev05_2004.pdf).

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_motor_vehicle_collisions_crashes(limit = 2)
  small_sample

  nyc_motor_vehicle_collisions_crashes(filters = list(borough = "BROOKLYN"))
}
#> # A tibble: 10,000 × 31
#>    crash_date      crash_time borough zip_code latitude longitude on_street_name
#>    <chr>           <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#>  1 2026-01-20T00:… 17:48      BROOKL… 11226    40.6505… -73.9558… CHURCH AVE    
#>  2 2026-01-20T00:… 7:07       BROOKL… 11203    40.6466… -73.92459 KINGS HWY     
#>  3 2026-01-20T00:… 7:54       BROOKL… 11207    40.6773… -73.89622 NEW JERSEY AVE
#>  4 2026-01-20T00:… 10:35      BROOKL… 11238    40.68315 -73.95768 PUTNAM AVE    
#>  5 2026-01-20T00:… 7:22       BROOKL… 11204    40.6225… -73.99461 NA            
#>  6 2026-01-20T00:… 8:37       BROOKL… 11213    40.67801 -73.9413… ATLANTIC AVE  
#>  7 2026-01-20T00:… 8:50       BROOKL… 11231    40.6746… -74.00771 COLUMBIA ST   
#>  8 2026-01-20T00:… 7:30       BROOKL… 11230    40.618   -73.95601 NA            
#>  9 2026-01-20T00:… 12:25      BROOKL… 11221    40.6843  -73.9412  JEFFERSON AVE 
#> 10 2026-01-20T00:… 8:48       BROOKL… 11203    40.6421… -73.92935 UTICA AVE     
#> # ℹ 9,990 more rows
#> # ℹ 24 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   collision_id <chr>, vehicle_type_code1 <chr>, …
# }
```
