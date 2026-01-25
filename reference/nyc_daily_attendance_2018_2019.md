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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_daily_attendance_2018_2019(limit = 2)
  small_sample

  nyc_daily_attendance_2018_2019(filters = list(school_dbn = "01M015"))
}
#> # A tibble: 178 × 6
#>    school_dbn date     enrolled absent present released
#>    <chr>      <chr>    <chr>    <chr>  <chr>   <chr>   
#>  1 01M015     20190626 174      45     129     0       
#>  2 01M015     20190625 174      37     137     0       
#>  3 01M015     20190624 174      21     153     0       
#>  4 01M015     20190621 174      27     147     0       
#>  5 01M015     20190620 174      21     153     0       
#>  6 01M015     20190619 174      11     163     0       
#>  7 01M015     20190618 174      18     156     0       
#>  8 01M015     20190617 174      11     163     0       
#>  9 01M015     20190614 175      9      166     0       
#> 10 01M015     20190613 175      14     161     0       
#> # ℹ 168 more rows
# }
```
