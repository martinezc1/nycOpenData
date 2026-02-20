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
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_cause_of_death(limit = 2)
  small_sample

  nyc_cause_of_death(limit = 2, filters = list(sex = "M"))
}
```
