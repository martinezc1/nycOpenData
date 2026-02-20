# NYC Violent and Disruptive Incidents

Downloads Violent and Disruptive Incidents data from NYC Open Data.

## Usage

``` r
nyc_violent_disruptive_school_incidents(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/fpci-ws56\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Violent and Disruptive Incidents data.

## Details

Incident counts and rates reported by NYC schools, broken out by
incident category, school, and school year. Useful for safety trend
analyses and comparisons across school types.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_violent_disruptive_school_incidents(limit = 2)
  small_sample

  nyc_violent_disruptive_school_incidents(
    limit = 2,
    filters = list(school_type = "Public")
  )
}
```
