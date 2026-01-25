# NYC Civil Service List (Active)

Downloads Civil Service List (Active) data from NYC Open Data.

## Usage

``` r
nyc_civil_service_list(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/vx8i-nprf\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Civil Service List (Active) data.

## Details

This dataset provides information about active Civil Service lists,
including eligible candidates, examination numbers, and certification
status. Published by the NYC Department of Citywide Administrative
Services (DCAS).

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_civil_service_list(limit = 2)
  small_sample

  nyc_civil_service_list(filters = list(last_name = "Martinez"))
}
#> # A tibble: 0 × 0
# }
```
