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

  nyc_open_parking_camera_violations(filters = list(state = "NJ"))
}
#> # A tibble: 10,000 × 20
#>    plate   state license_type summons_number issue_date violation_time violation
#>    <chr>   <chr> <chr>        <chr>          <chr>      <chr>          <chr>    
#>  1 2DY75G  NJ    PAS          1362720975     51/71/2004 NA             NA       
#>  2 RHE42L  NJ    PAS          1323616410     41/17/2011 NA             NA       
#>  3 367727N NJ    PAS          1355370176     29/06/2014 NA             NA       
#>  4 XBGC58  NJ    PAS          9122563489     2024-05-0… 11:57A         NO STAND…
#>  5 C87LTZ  NJ    PAS          9124700990     2024-05-0… 02:33P         NO STAND…
#>  6 W19RTA  NJ    PAS          9124926164     2024-04-3… 08:55A         NO STAND…
#>  7 XNHC17  NJ    PAS          9124745418     2024-04-3… 09:46A         NO STAND…
#>  8 D19RLK  NJ    PAS          9122101846     2024-04-2… 02:23P         MISUSE P…
#>  9 E24UBR  NJ    PAS          9126550234     2024-04-2… 03:45P         FRAUDULE…
#> 10 W51SAF  NJ    PAS          9120614263     2024-04-2… 09:47A         FRAUDULE…
#> # ℹ 9,990 more rows
#> # ℹ 13 more variables: fine_amount <chr>, penalty_amount <chr>,
#> #   interest_amount <chr>, reduction_amount <chr>, payment_amount <chr>,
#> #   amount_due <chr>, precinct <chr>, county <chr>, issuing_agency <chr>,
#> #   violation_status <chr>, judgment_entry_date <chr>, summons_image.url <chr>,
#> #   summons_image.description <chr>
# }
```
