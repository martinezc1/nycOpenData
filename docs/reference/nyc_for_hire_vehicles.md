# NYC For-Hire Vehicles (FHV) - Active

Downloads For-Hire Vehicles (FHV) - Active data from NYC Open Data.

## Usage

``` r
nyc_for_hire_vehicles(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/8wbx-tsch\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing For-Hire Vehicles (FHV) - Active data.

## Details

This dataset includes all active For-Hire Vehicle (FHV) licenses in NYC,
such as taxis, limousines, and app-based services (e.g., Uber, Lyft).
Maintained by the NYC Taxi and Limousine Commission (TLC).

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_for_hire_vehicles(limit = 2)
  small_sample

  nyc_for_hire_vehicles(limit = 2, filters = list(active = "YES"))
}
#> # A tibble: 2 × 21
#>   active vehicle_license_number name               license_type  expiration_date
#>   <chr>  <chr>                  <chr>              <chr>         <chr>          
#> 1 YES    6032728                UPPAL, ARSHDEEP    FOR HIRE VEH… 2026-06-30T00:…
#> 2 YES    5953896                ELIHORI,ASIM,SALIH FOR HIRE VEH… 2027-11-07T00:…
#> # ℹ 16 more variables: permit_license_number <chr>,
#> #   dmv_license_plate_number <chr>, vehicle_vin_number <chr>,
#> #   wheelchair_accessible <chr>, vehicle_year <chr>, base_number <chr>,
#> #   base_name <chr>, base_type <chr>, veh <chr>, base_telephone_number <chr>,
#> #   base_address <chr>, reason <chr>, last_date_updated <chr>,
#> #   last_time_updated <chr>, certification_date <chr>, hack_up_date <chr>
# }
```
