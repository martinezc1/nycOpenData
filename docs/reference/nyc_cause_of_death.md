# New York City Leading Causes of Death

Downloads New York City Leading Causes of Death data from NYC Open Data.

## Usage

``` r
nyc_cause_of_death(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Health/New-York-City-Leading-Causes-of-Death/jb7j-dtam/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing New York City Leading Causes of Death data.

## Details

The leading causes of death by sex and ethnicity in New York City in
since 2007. Cause of death is derived from the NYC death certificate
which is issued for every death that occurs in New York City.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_cause_of_death(limit = 2)
  small_sample

  nyc_cause_of_death(limit = 2, filters = list(sex = "M"))
}
#> # A tibble: 2 × 7
#>   year  leading_cause                     sex   race_ethnicity deaths death_rate
#>   <chr> <chr>                             <chr> <chr>          <chr>  <chr>     
#> 1 2018  Mental and Behavioral Disorders … M     Other Race/ E… 13     NA        
#> 2 2018  Mental and Behavioral Disorders … M     Non-Hispanic … 271    32.335    
#> # ℹ 1 more variable: age_adjusted_death_rate <chr>
# }
```
