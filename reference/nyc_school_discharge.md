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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_school_discharge(limit = 2)
  small_sample

  nyc_school_discharge(filters = list(school_level = "High School"))
}
#> # A tibble: 10,000 × 9
#>    year      report_category school_level geographic_unit school_name           
#>    <chr>     <chr>           <chr>        <chr>           <chr>                 
#>  1 2022-2023 School          High School  32K556          BUSHWICK LEADERS HS F…
#>  2 2022-2023 School          High School  32K564          BUSHWICK COMMUNITY HS 
#>  3 2022-2023 School          High School  32K564          BUSHWICK COMMUNITY HS 
#>  4 2022-2023 School          High School  32K564          BUSHWICK COMMUNITY HS 
#>  5 2022-2023 School          High School  32K564          BUSHWICK COMMUNITY HS 
#>  6 2022-2023 School          High School  75K036          PS 36                 
#>  7 2022-2023 School          High School  75K036          PS 36                 
#>  8 2022-2023 School          High School  75K053          PS K053               
#>  9 2022-2023 School          High School  75K053          PS K053               
#> 10 2022-2023 School          High School  75K140          PS K140               
#> # ℹ 9,990 more rows
#> # ℹ 4 more variables: student_category <chr>, discharge_category <chr>,
#> #   count_of_students <chr>, total_enrolled_students <chr>
# }
```
