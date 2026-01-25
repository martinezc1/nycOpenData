# 2013-2015 School Closure Discharge Reporting

Downloads 2013-2015 School Closure Discharge Reporting data from NYC
Open Data.

## Usage

``` r
nyc_school_discharge_report_2013_2015(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/2013-2015-School-Closure-Discharge-Reporting/r773-ytwa/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing School Closure Discharge data.

## Details

This report provides data regarding students enrolled in the closed
schools according to the guidelines set by Local Law 43 of 2011.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_school_discharge_report_2013_2015(limit = 2)
  small_sample

  nyc_school_discharge_report_2013_2015(filters = list(geography = "Citywide"))
}
#> # A tibble: 10,000 × 11
#>    school_year geography report_category by_group              group_demographic
#>    <chr>       <chr>     <chr>           <chr>                 <chr>            
#>  1 2014-2015   Citywide  Attendance Rate Gender by Attendance… Female           
#>  2 2014-2015   Citywide  Attendance Rate Gender by Attendance… Female           
#>  3 2014-2015   Citywide  Attendance Rate Gender by Attendance… Female           
#>  4 2014-2015   Citywide  Attendance Rate Gender by Attendance… Female           
#>  5 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#>  6 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#>  7 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#>  8 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#>  9 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#> 10 2014-2015   Citywide  Attendance Rate Gender by Attendance… Male             
#> # ℹ 9,990 more rows
#> # ℹ 6 more variables: group_metrics <chr>, value <chr>,
#> #   percentage_within_demographic <chr>, total_number_within <chr>,
#> #   to_school_dbn <chr>, to_school_name <chr>
# }
```
