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

  nyc_for_hire_vehicles(filters = list(active = "YES"))
}
#> # A tibble: 10,000 × 22
#>    active vehicle_license_number name               license_type expiration_date
#>    <chr>  <chr>                  <chr>              <chr>        <chr>          
#>  1 YES    6032728                UPPAL, ARSHDEEP    FOR HIRE VE… 2026-06-30T00:…
#>  2 YES    5953896                ELIHORI,ASIM,SALIH FOR HIRE VE… 2027-11-07T00:…
#>  3 YES    5729129                LORENZO,MARTIN     FOR HIRE VE… 2026-10-12T00:…
#>  4 YES    6035913                GULYAMOV,,AMINJON  FOR HIRE VE… 2026-06-30T00:…
#>  5 YES    6033635                KHAN,DEWAN,M       FOR HIRE VE… 2026-06-30T00:…
#>  6 YES    6039929                HOSSAIN,MD,ALAMGIR FOR HIRE VE… 2027-08-21T00:…
#>  7 YES    5964337                FRIAS,RAFAEL,A     FOR HIRE VE… 2026-08-21T00:…
#>  8 YES    6036626                AHMED,IQBAL        FOR HIRE VE… 2027-07-21T00:…
#>  9 YES    6043991                ABSALOMOV, ILKHOM  FOR HIRE VE… 2026-06-30T00:…
#> 10 YES    5964655                ALI,NUSRAT         FOR HIRE VE… 2026-09-09T00:…
#> # ℹ 9,990 more rows
#> # ℹ 17 more variables: permit_license_number <chr>,
#> #   dmv_license_plate_number <chr>, vehicle_vin_number <chr>,
#> #   wheelchair_accessible <chr>, vehicle_year <chr>, base_number <chr>,
#> #   base_name <chr>, base_type <chr>, veh <chr>, base_telephone_number <chr>,
#> #   base_address <chr>, reason <chr>, last_date_updated <chr>,
#> #   last_time_updated <chr>, certification_date <chr>, hack_up_date <chr>, …
# }
```
