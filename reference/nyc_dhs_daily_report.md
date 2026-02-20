# NYC Department of Homeless Services (DHS) Daily Report

Department of Homeless Services (DHS) Daily Report

## Usage

``` r
nyc_dhs_daily_report(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/DHS-Daily-Report/k46n-sa2m/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Department of Homeless Services (DHS) Daily Report
data.

## Details

This dataset includes the daily number of families and individuals
residing in the Department of Homeless Services (DHS) shelter system and
the daily number of families applying to the DHS shelter system.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dhs_daily_report(limit = 2)
  small_sample

  nyc_dhs_daily_report(limit = 2, filters = list(total_adults_in_shelter = 55694))
}
```
