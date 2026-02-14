# NYPD Shootings

Downloads NYPD Shooting Incident data from NYC Open Data.

## Usage

``` r
nyc_shooting_incidents(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Public-Safety/NYPD-Shootings/98wc-x49t/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYPD Shooting Incident Data (Year to Date) data.

## Details

This is a dataset identifies of every shooting incident that occurred in
NYC since 2006.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_shooting_incidents(limit = 2)
  small_sample

  nyc_shooting_incidents(limit = 2, filters = list(boro = "BROOKLYN"))
}
```
