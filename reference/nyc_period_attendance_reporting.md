# Statistical Summary Period Attendance Reporting (PAR)

Downloads Statistical Summary Period Attendance Reporting (PAR) from NYC
Open Data.

## Usage

``` r
nyc_period_attendance_reporting(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/Statistical-Summary-Period-Attendance-Reporting-PA/hrsu-3w2q/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Period Attendance data.

## Details

Statistical report on attendance by borough, grade. Alternate views of
same data by grade level and enrollment (register). All students
including YABC, adults, LYFE babies and charters, home instruction,
home/hospital, CBO UPK.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_period_attendance_reporting(limit = 2)
  small_sample

  nyc_period_attendance_reporting(limit = 2, filters = list(boro = "X"))
}
```
