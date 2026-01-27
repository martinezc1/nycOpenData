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
#>  1 2026-01-23T00:… 11:20      BROOKL… 11219    40.6325… -74.0063  FORT HAMILTON…
#>  2 2026-01-23T00:… 16:13      BROOKL… 11219    40.62677 -73.99354 59 ST         
#>  3 2026-01-23T00:… 21:16      BROOKL… 11236    40.6343… -73.90198 AVENUE L      
#>  4 2026-01-23T00:… 16:05      BROOKL… 11226    40.6487… -73.95019 NA            
#>  5 2026-01-23T00:… 16:02      BROOKL… 11213    40.67356 -73.9362… TROY AVE      
#>  6 2026-01-23T00:… 6:45       BROOKL… 11234    40.6185… -73.94242 NEW YORK AVE  
#>  7 2026-01-23T00:… 21:01      BROOKL… 11230    40.62628 -73.95629 NA            
#>  8 2026-01-23T00:… 22:10      BROOKL… 11201    40.6892… -73.98872 STATE ST      
#>  9 2026-01-23T00:… 22:04      BROOKL… 11237    40.69328 -73.90429 IRVING AVE    
#> 10 2026-01-23T00:… 23:45      BROOKL… 11226    40.6510… -73.9643… CATON AVE     
#> # ℹ 9,990 more rows
#> # ℹ 24 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   contributing_factor_vehicle_2 <chr>, collision_id <chr>, …
# }
```
