# 2018-2019 Daily Attendance

Downloads 2018-2019 Daily Student Attendance from NYC Open Data.

## Usage

``` r
nyc_daily_attendance_2018_2019(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/2018-2019-Daily-Attendance/x3bb-kg5j/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing 2018–2019 NYC Daily Student Attendance data.

## Details

Daily listing (counts) of students registered, present, absent and
released by School DBN.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_daily_attendance_2018_2019(limit = 2)
  small_sample

  nyc_daily_attendance_2018_2019(
    limit = 2,
    filters = list(school_dbn = "01M015")
  )
}
```
