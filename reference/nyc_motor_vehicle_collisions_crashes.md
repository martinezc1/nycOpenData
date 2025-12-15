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
#> # A tibble: 6 × 27
#>   crash_date       crash_time borough zip_code latitude longitude on_street_name
#>   <chr>            <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#> 1 2025-12-09T00:0… 13:00      STATEN… 10306    40.58124 -74.09844 HYLAN BLVD    
#> 2 2025-12-09T00:0… 7:30       MANHAT… 10013    40.7205… -74.0022… NA            
#> 3 2025-12-09T00:0… 18:50      NA      NA       40.68798 -73.80529 109 AVENUE    
#> 4 2025-12-09T00:0… 14:15      MANHAT… 10018    40.75898 -73.9939… W 42 ST       
#> 5 2025-12-09T00:0… 18:45      NA      NA       40.61898 -74.1638… STATEN ISLAND…
#> 6 2025-12-09T00:0… 23:53      MANHAT… 10017    40.7488  -73.96985 E 42 ST       
#> # ℹ 20 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   contributing_factor_vehicle_2 <chr>, collision_id <chr>,
#> #   vehicle_type_code1 <chr>, cross_street_name <chr>, …

# \donttest{
nyc_motor_vehicle_collisions_crashes(limit = 5000)
#> # A tibble: 5,000 × 31
#>    crash_date      crash_time borough zip_code latitude longitude on_street_name
#>    <chr>           <chr>      <chr>   <chr>    <chr>    <chr>     <chr>         
#>  1 2025-12-09T00:… 13:00      STATEN… 10306    40.58124 -74.09844 HYLAN BLVD    
#>  2 2025-12-09T00:… 7:30       MANHAT… 10013    40.7205… -74.0022… NA            
#>  3 2025-12-09T00:… 18:50      NA      NA       40.68798 -73.80529 109 AVENUE    
#>  4 2025-12-09T00:… 14:15      MANHAT… 10018    40.75898 -73.9939… W 42 ST       
#>  5 2025-12-09T00:… 18:45      NA      NA       40.61898 -74.1638… STATEN ISLAND…
#>  6 2025-12-09T00:… 23:53      MANHAT… 10017    40.7488  -73.96985 E 42 ST       
#>  7 2025-12-09T00:… 14:45      QUEENS  11375    40.7322… -73.8492… 64 RD         
#>  8 2025-12-09T00:… 8:07       QUEENS  11429    40.7117… -73.74628 212 ST        
#>  9 2025-12-09T00:… 18:10      QUEENS  11372    40.7473… -73.89057 75 ST         
#> 10 2025-12-09T00:… 14:34      MANHAT… 10036    40.75979 -73.98792 8 AVE         
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
#>  1 2025-12-09T00:… 10:40      BROOKL… 11215    40.6732… -73.9928… 8 ST          
#>  2 2025-12-09T00:… 10:12      BROOKL… 11217    40.6865  -73.9864  NA            
#>  3 2025-12-09T00:… 13:05      BROOKL… 11207    40.6616… -73.89331 NA            
#>  4 2025-12-09T00:… 9:38       BROOKL… 11223    40.6003… -73.96812 NA            
#>  5 2025-12-09T00:… 9:00       BROOKL… 11249    40.6999… -73.96118 NA            
#>  6 2025-12-09T00:… 18:00      BROOKL… 11203    40.6631… -73.93726 TROY AVE      
#>  7 2025-12-09T00:… 16:10      BROOKL… 11235    40.5786… -73.96667 OCEAN VIEW AVE
#>  8 2025-12-09T00:… 6:30       BROOKL… 11220    40.6419… -74.00624 NA            
#>  9 2025-12-09T00:… 9:18       BROOKL… 11234    40.61957 -73.93354 FLATBUSH AVE  
#> 10 2025-12-09T00:… 9:01       BROOKL… 11231    40.6757… -73.99836 NA            
#> # ℹ 9,990 more rows
#> # ℹ 24 more variables: off_street_name <chr>, number_of_persons_injured <chr>,
#> #   number_of_persons_killed <chr>, number_of_pedestrians_injured <chr>,
#> #   number_of_pedestrians_killed <chr>, number_of_cyclist_injured <chr>,
#> #   number_of_cyclist_killed <chr>, number_of_motorist_injured <chr>,
#> #   number_of_motorist_killed <chr>, contributing_factor_vehicle_1 <chr>,
#> #   contributing_factor_vehicle_2 <chr>, collision_id <chr>, …
# }
```
