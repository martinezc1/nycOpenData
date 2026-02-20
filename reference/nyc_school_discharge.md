# NYC School Discharge Reporting (Local Law 42)

Downloads School Discharge Reporting (Local Law 42) data from NYC Open
Data.

## Usage

``` r
nyc_school_discharge(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/a2gn-nyzs\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing School Discharge Reporting (Local Law 42) data.

## Details

This dataset reports student discharges from NYC public schools, as
required under Local Law 42. It includes counts and percentages of
students discharged by category, such as transfer, dropout, or other
reasons. Data are aggregated by school and year, supporting analysis of
student outcomes across the city.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_school_discharge(limit = 2)
  small_sample

  nyc_school_discharge(
    limit = 2,
    filters = list(school_level = "High School")
  )
}
```
