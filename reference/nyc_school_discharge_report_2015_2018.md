# 2015-2018 School Closure Discharge Reporting

Downloads 2015-2018 School Closure Discharge Reporting data from NYC
Open Data.

## Usage

``` r
nyc_school_discharge_report_2015_2018(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/2015-2018-School-Closure-Discharge-Reporting/abh8-frsx/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing School Closure Discharge Report data.

## Details

This dataset provides data regarding students enrolled in the closed
schools according to the guidelines set by Local Law 43 of 2011.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_school_discharge_report_2015_2018(limit = 10)
head(small_sample)
#> # A tibble: 6 × 9
#>   school_year geography report_category report_subcategory dbn    category_group
#>   <chr>       <chr>     <chr>           <chr>              <chr>  <chr>         
#> 1 2017-2018   School    SWD             Not SWD            08X519 Credit Recove…
#> 2 2017-2018   School    SWD             Not SWD            09X325 Credit Recove…
#> 3 2017-2018   School    SWD             Not SWD            12X092 Credit Recove…
#> 4 2017-2018   School    SWD             Not SWD            12X321 Credit Recove…
#> 5 2017-2018   School    SWD             Not SWD            12X321 Credit Recove…
#> 6 2017-2018   School    SWD             Not SWD            12X372 Credit Recove…
#> # ℹ 3 more variables: category_subgroup <chr>, value <chr>,
#> #   value_percentage <chr>

# \donttest{
nyc_school_discharge_report_2015_2018(limit = 5000)
#> # A tibble: 5,000 × 9
#>    school_year geography report_category report_subcategory dbn   category_group
#>    <chr>       <chr>     <chr>           <chr>              <chr> <chr>         
#>  1 2017-2018   School    SWD             Not SWD            08X5… Credit Recove…
#>  2 2017-2018   School    SWD             Not SWD            09X3… Credit Recove…
#>  3 2017-2018   School    SWD             Not SWD            12X0… Credit Recove…
#>  4 2017-2018   School    SWD             Not SWD            12X3… Credit Recove…
#>  5 2017-2018   School    SWD             Not SWD            12X3… Credit Recove…
#>  6 2017-2018   School    SWD             Not SWD            12X3… Credit Recove…
#>  7 2017-2018   School    SWD             Not SWD            12X3… To School     
#>  8 2017-2018   School    SWD             Not SWD            12X3… To School     
#>  9 2017-2018   School    SWD             Not SWD            12X3… To School     
#> 10 2017-2018   School    SWD             Not SWD            12X3… To School     
#> # ℹ 4,990 more rows
#> # ℹ 3 more variables: category_subgroup <chr>, value <chr>,
#> #   value_percentage <chr>
nyc_school_discharge_report_2015_2018(filters = list(geography = "Borough"))
#> # A tibble: 10,000 × 9
#>    school_year geography report_category report_subcategory borough  
#>    <chr>       <chr>     <chr>           <chr>              <chr>    
#>  1 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  2 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  3 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  4 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  5 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  6 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  7 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  8 2017-2018   Borough   SWD             Not SWD            Manhattan
#>  9 2017-2018   Borough   SWD             Not SWD            Manhattan
#> 10 2017-2018   Borough   SWD             Not SWD            Manhattan
#> # ℹ 9,990 more rows
#> # ℹ 4 more variables: category_group <chr>, category_subgroup <chr>,
#> #   value <chr>, value_percentage <chr>
# }
```
