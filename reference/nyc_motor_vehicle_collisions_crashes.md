# Motor Vehicle Collisions - Crashes

Downloads Motor Vehicle Collisions - Crashes data from NYC Open Data.

## Usage

``` r
nyc_motor_vehicle_collisions_crashes(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

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
# Quick example (fetch 10 rows)
small_sample <- nyc_motor_vehicle_collisions_crashes(limit = 10)
head(small_sample)
#> # A tibble: 6 × 26
#>   crash_date       crash_time borough zip_code latitude longitude on_street_name
#>   <chr>            <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#> 1 2026-01-20T00:0… 8:30       QUEENS  11433    40.70197 -73.8018… ARCHER AVE    
#> 2 2026-01-20T00:0… 15:04      QUEENS  11357    40.7867… -73.82384 14 AVENUE     
#> 3 2026-01-20T00:0… 17:48      BROOKL… 11226    40.6505… -73.9558… CHURCH AVE    
#> 4 2026-01-20T00:0… 19:41      QUEENS  11377    40.74719 -73.90268 61 ST         
#> 5 2026-01-20T00:0… 9:00       MANHAT… 10038    0.00000… 0.0000000 NA            
#> 6 2026-01-20T00:0… 8:47       QUEENS  11370    40.7672  -73.88782 82 ST         
#> # ℹ 19 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   contributing_factor_vehicle_2 <chr>, collision_id <chr>,
#> #   vehicle_type_code1 <chr>, vehicle_type_code2 <chr>, …

# \donttest{
nyc_motor_vehicle_collisions_crashes(limit = 5000)
#> # A tibble: 5,000 × 31
#>    crash_date      crash_time borough zip_code latitude longitude on_street_name
#>    <chr>           <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#>  1 2026-01-20T00:… 8:30       QUEENS  11433    40.70197 -73.8018… ARCHER AVE    
#>  2 2026-01-20T00:… 15:04      QUEENS  11357    40.7867… -73.82384 14 AVENUE     
#>  3 2026-01-20T00:… 17:48      BROOKL… 11226    40.6505… -73.9558… CHURCH AVE    
#>  4 2026-01-20T00:… 19:41      QUEENS  11377    40.74719 -73.90268 61 ST         
#>  5 2026-01-20T00:… 9:00       MANHAT… 10038    0.00000… 0.0000000 NA            
#>  6 2026-01-20T00:… 8:47       QUEENS  11370    40.7672  -73.88782 82 ST         
#>  7 2026-01-20T00:… 7:10       NA      NA       40.6087… -74.0380… VERRAZANO BRI…
#>  8 2026-01-20T00:… 7:07       BROOKL… 11203    40.6466… -73.92459 KINGS HWY     
#>  9 2026-01-20T00:… 7:40       STATEN… 10306    40.56453 -74.1417… BLYTHE PL     
#> 10 2026-01-20T00:… 7:54       BROOKL… 11207    40.6773… -73.89622 NEW JERSEY AVE
#> # ℹ 4,990 more rows
#> # ℹ 24 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   contributing_factor_vehicle_2 <chr>, collision_id <chr>, …
nyc_motor_vehicle_collisions_crashes(filters = list(borough = "BROOKLYN"))
#> # A tibble: 10,000 × 31
#>    crash_date      crash_time borough zip_code latitude longitude on_street_name
#>    <chr>           <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#>  1 2026-01-20T00:… 17:48      BROOKL… 11226    40.6505… -73.9558… CHURCH AVE    
#>  2 2026-01-20T00:… 8:50       BROOKL… 11231    40.6746… -74.00771 COLUMBIA ST   
#>  3 2026-01-20T00:… 7:22       BROOKL… 11204    40.6225… -73.99461 NA            
#>  4 2026-01-20T00:… 4:48       BROOKL… 11238    40.6729… -73.9674… EASTERN PKWY  
#>  5 2026-01-20T00:… 18:02      BROOKL… 11226    40.6413… -73.9477… NA            
#>  6 2026-01-20T00:… 13:50      BROOKL… 11230    0.00000… 0.0000000 NA            
#>  7 2026-01-20T00:… 14:05      BROOKL… 11215    40.67045 -73.9819… 6 AVE         
#>  8 2026-01-20T00:… 8:37       BROOKL… 11213    40.67801 -73.9413… ATLANTIC AVE  
#>  9 2026-01-20T00:… 2:47       BROOKL… 11222    40.7237… -73.93753 CHERRY ST     
#> 10 2026-01-20T00:… 16:55      BROOKL… 11208    40.68081 -73.8848… ARLINGTON AVE 
#> # ℹ 9,990 more rows
#> # ℹ 24 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   collision_id <chr>, vehicle_type_code1 <chr>, …
# }
```
