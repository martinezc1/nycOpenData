# Open Parking and Camera Violations

Downloads Open Parking and Camera Violations data from NYC Open Data.

## Usage

``` r
nyc_open_parking_camera_violations(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/Open-Parking-and-Camera-Violations/nc67-uf89/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Open Parking and Camera Violations data.

## Details

The Open Parking and Camera Violations dataset was initially loaded with
all violations contained in the mainframe database as of May 2016.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_open_parking_camera_violations(limit = 2)
  small_sample

  nyc_open_parking_camera_violations(limit = 2, filters = list(state = "NJ"))
}
#> # A tibble: 2 × 7
#>   plate  state license_type summons_number issue_date summons_image.url         
#>   <chr>  <chr> <chr>        <chr>          <chr>      <chr>                     
#> 1 2DY75G NJ    PAS          1362720975     51/71/2004 http://nycserv.nyc.gov/NY…
#> 2 RHE42L NJ    PAS          1323616410     41/17/2011 http://nycserv.nyc.gov/NY…
#> # ℹ 1 more variable: summons_image.description <chr>
# }
```
