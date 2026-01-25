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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_period_attendance_reporting(limit = 2)
  small_sample

  nyc_period_attendance_reporting(filters = list(boro = "X"))
}
#> # A tibble: 5,760 × 39
#>    boro  year      period district level school grade_code instruction_days
#>    <chr> <chr>     <chr>  <chr>    <chr> <chr>  <chr>      <chr>           
#>  1 X     2015-2016 1      10       110   246    0          12              
#>  2 X     2015-2016 2      8        220   269    0          21              
#>  3 X     2015-2016 3      12       110   134    0          17              
#>  4 X     2015-2016 2      11       110   178    0          21              
#>  5 X     2015-2016 1      10       110   46     0          12              
#>  6 X     2015-2016 1      8        110   48     0          12              
#>  7 X     2015-2016 3      9        340   276    0          17              
#>  8 X     2015-2016 2      8        340   561    0          21              
#>  9 X     2015-2016 1      11       340   418    0          12              
#> 10 X     2015-2016 2      8        340   282    0          21              
#> # ℹ 5,750 more rows
#> # ℹ 31 more variables: religious_holydays <chr>, classes <chr>,
#> #   register_last_report <chr>, admissions <chr>, transfers_in <chr>,
#> #   discharges <chr>, transfers_out <chr>, present_register <chr>,
#> #   aggregate_register <chr>, aggregate_attendance <chr>,
#> #   holyday_counter <chr>, register_01 <chr>, attendance_01 <chr>,
#> #   register_02 <chr>, attendance_02 <chr>, register_03 <chr>, …
# }
```
