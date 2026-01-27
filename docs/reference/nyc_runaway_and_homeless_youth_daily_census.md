# NYC Runaway and Homeless Youth (RHY) Daily Census

Runaway and Homeless Youth (RHY) Daily Census

## Usage

``` r
nyc_runaway_and_homeless_youth_daily_census(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Runaway-and-Homeless-Youth-RHY-Daily-Census/5rw7-99k7/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Runaway and Homeless Youth (RHY) Daily Census data.

## Details

This data tracks the number of beds available for runaway and homeless
youth and young adults as well as the number and percent vacant. Data
include Crisis Shelters, Crisis Shelters HYA (Homeless Young Adults),
Transitional Independent Living, and Transitional Independent Living
HYA.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_runaway_and_homeless_youth_daily_census(limit = 2)
  small_sample

  nyc_runaway_and_homeless_youth_daily_census(limit = 2,
  filters = list(program_type = "Crisis Shelters")
  )
}
#> # A tibble: 2 × 5
#>   date                program_type vacancies_per_day beds_per_day vacant_per_day
#>   <chr>               <chr>        <chr>             <chr>        <chr>         
#> 1 2025-06-30T00:00:0… Crisis Shel… 40                258          0.16          
#> 2 2025-06-29T00:00:0… Crisis Shel… 34                258          0.13          
# }
```
