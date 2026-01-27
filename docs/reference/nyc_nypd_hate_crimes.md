# NYC NYPD Hate Crimes

Downloads NYPD Hate Crimes data from NYC Open Data.

## Usage

``` r
nyc_nypd_hate_crimes(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/bqiq-cu78\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYC NYPD Hate Crimes data.

## Details

This dataset contains records of hate crime incidents reported by the
NYPD. Each entry includes the bias motivation, offense category, and
borough, providing insight into hate crime trends across New York City.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_nypd_hate_crimes(limit = 2)
  small_sample

  nyc_nypd_hate_crimes(limit = 2, filters = list(county = "KINGS"))
}
#> # A tibble: 2 × 12
#>   full_complaint_id complaint_year_number month_number record_create_date     
#>   <chr>             <chr>                 <chr>        <chr>                  
#> 1 202509412490517   2025                  9            2025-09-30T00:00:00.000
#> 2 202509012669817   2025                  9            2025-09-29T00:00:00.000
#> # ℹ 8 more variables: complaint_precinct_code <chr>, patrol_borough_name <chr>,
#> #   county <chr>, law_code_category_description <chr>,
#> #   offense_description <chr>, pd_code_description <chr>,
#> #   bias_motive_description <chr>, offense_category <chr>
# }
```
