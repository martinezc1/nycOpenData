# NYC DOP Juvenile Rearrest Rate (Monthly Average)

Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC
Open Data.

## Usage

``` r
nyc_dop_juvenile_rearrest_rate(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/c87b-2j3i\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average)
data.

## Details

This dataset provides the average monthly rate of juvenile rearrests
reported by the NYC Department of Probation (DOP). Data includes region,
year, and monthly averages, allowing for trend analysis across boroughs.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 2)
  small_sample

  nyc_dop_juvenile_rearrest_rate(filters = list(borough = "Citywide"))
}
#> # A tibble: 117 × 4
#>    borough  month     year  rate 
#>    <chr>    <chr>     <chr> <chr>
#>  1 Citywide November  2025  4.5  
#>  2 Citywide October   2025  4.7  
#>  3 Citywide September 2025  4.9  
#>  4 Citywide August    2025  4.1  
#>  5 Citywide July      2025  4.7  
#>  6 Citywide June      2025  4.7  
#>  7 Citywide May       2025  4.4  
#>  8 Citywide April     2025  4.4  
#>  9 Citywide March     2025  4.3  
#> 10 Citywide February  2025  4.1  
#> # ℹ 107 more rows
# }
```
