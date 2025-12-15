# 2018-2019 Daily Attendance

Downloads 2018-2019 Daily Student Attendance from NYC Open Data.

## Usage

``` r
nyc_daily_attendance_2018_2019(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Education/2018-2019-Daily-Attendance/x3bb-kg5j/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing 2018–2019 NYC Daily Student Attendance data.

## Details

Daily listing (counts) of students registered, present, absent and
released by School DBN.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_daily_attendance_2018_2019(limit = 10)
head(small_sample)
#> # A tibble: 6 × 6
#>   school_dbn date     enrolled absent present released
#>   <chr>      <chr>    <chr>    <chr>  <chr>   <chr>   
#> 1 79X695     20190626 216      27     68      121     
#> 2 31R030     20190626 838      53     785     0       
#> 3 31R031     20190626 392      83     309     0       
#> 4 31R032     20190626 676      47     629     0       
#> 5 31R034     20190626 1058     80     976     2       
#> 6 31R035     20190626 410      36     374     0       

# \donttest{
nyc_daily_attendance_2018_2019(limit = 5000)
#> # A tibble: 5,000 × 6
#>    school_dbn date     enrolled absent present released
#>    <chr>      <chr>    <chr>    <chr>  <chr>   <chr>   
#>  1 79X695     20190626 216      27     68      121     
#>  2 31R030     20190626 838      53     785     0       
#>  3 31R031     20190626 392      83     309     0       
#>  4 31R032     20190626 676      47     629     0       
#>  5 31R034     20190626 1058     80     976     2       
#>  6 31R035     20190626 410      36     374     0       
#>  7 31R036     20190626 862      35     827     0       
#>  8 31R038     20190626 365      36     329     0       
#>  9 31R039     20190626 535      61     474     0       
#> 10 31R041     20190626 702      44     658     0       
#> # ℹ 4,990 more rows
nyc_daily_attendance_2018_2019(filters = list(school_dbn = "01M015"))
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
