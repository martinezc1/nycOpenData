# 2013-2015 School Closure Discharge Reporting

Downloads 2013-2015 School Closure Discharge Reporting data from NYC
Open Data.

## Usage

``` r
nyc_school_discharge_report_2013_2015(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/2013-2015-School-Closure-Discharge-Reporting/r773-ytwa/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing School Closure Discharge data.

## Details

This report provides data regarding students enrolled in the closed
schools according to the guidelines set by Local Law 43 of 2011.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_school_discharge_report_2013_2015(limit = 10)
head(small_sample)
#> # A tibble: 6 × 11
#>   school_year geography report_category school_dbn school_name          by_group
#>   <chr>       <chr>     <chr>           <chr>      <chr>                <chr>   
#> 1 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> 2 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> 3 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> 4 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> 5 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> 6 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius … Gender …
#> # ℹ 5 more variables: group_demographic <chr>, group_metrics <chr>,
#> #   value <chr>, percentage_within_demographic <chr>, total_number_within <chr>

# \donttest{
nyc_school_discharge_report_2013_2015(limit = 5000)
#> # A tibble: 5,000 × 13
#>    school_year geography report_category school_dbn school_name         by_group
#>    <chr>       <chr>     <chr>           <chr>      <chr>               <chr>   
#>  1 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  2 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  3 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  4 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  5 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  6 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  7 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  8 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Gender …
#>  9 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Grade b…
#> 10 2014-2015   School    Attendance Rate 31R014     P.S. 014 Cornelius… Grade b…
#> # ℹ 4,990 more rows
#> # ℹ 7 more variables: group_demographic <chr>, group_metrics <chr>,
#> #   value <chr>, percentage_within_demographic <chr>,
#> #   total_number_within <chr>, to_school_dbn <chr>, to_school_name <chr>
nyc_school_discharge_report_2013_2015(filters = list(geography = "Citywide"))
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
