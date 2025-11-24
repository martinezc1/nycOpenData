# NYC NYPD Hate Crimes

Downloads NYPD Hate Crimes data from NYC Open Data.

## Usage

``` r
nyc_nypd_hate_crimes(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/bqiq-cu78\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing NYC NYPD Hate Crimes data.

## Details

This dataset contains records of hate crime incidents reported by the
NYPD. Each entry includes the bias motivation, offense category, and
borough, providing insight into hate crime trends across New York City.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_nypd_hate_crimes(limit = 10)
head(small_sample)
#> # A tibble: 6 × 13
#>   full_complaint_id complaint_year_number month_number record_create_date     
#>   <chr>             <chr>                 <chr>        <chr>                  
#> 1 202500612565517   2025                  9            2025-09-30T00:00:00.000
#> 2 202509412490517   2025                  9            2025-09-30T00:00:00.000
#> 3 202504912923517   2025                  9            2025-09-30T00:00:00.000
#> 4 202502412546217   2025                  9            2025-09-29T00:00:00.000
#> 5 202504512805217   2025                  9            2025-09-29T00:00:00.000
#> 6 202501813020617   2025                  9            2025-09-29T00:00:00.000
#> # ℹ 9 more variables: complaint_precinct_code <chr>, patrol_borough_name <chr>,
#> #   county <chr>, law_code_category_description <chr>,
#> #   offense_description <chr>, pd_code_description <chr>,
#> #   bias_motive_description <chr>, offense_category <chr>, arrest_id <chr>

# \donttest{
nyc_nypd_hate_crimes(limit = 5000)
#> # A tibble: 3,872 × 13
#>    full_complaint_id complaint_year_number month_number record_create_date     
#>    <chr>             <chr>                 <chr>        <chr>                  
#>  1 202500612565517   2025                  9            2025-09-30T00:00:00.000
#>  2 202509412490517   2025                  9            2025-09-30T00:00:00.000
#>  3 202504912923517   2025                  9            2025-09-30T00:00:00.000
#>  4 202502412546217   2025                  9            2025-09-29T00:00:00.000
#>  5 202504512805217   2025                  9            2025-09-29T00:00:00.000
#>  6 202501813020617   2025                  9            2025-09-29T00:00:00.000
#>  7 202502812571117   2025                  9            2025-09-29T00:00:00.000
#>  8 202509012669817   2025                  9            2025-09-29T00:00:00.000
#>  9 202502812571117   2025                  9            2025-09-29T00:00:00.000
#> 10 202507012783417   2025                  9            2025-09-26T00:00:00.000
#> # ℹ 3,862 more rows
#> # ℹ 9 more variables: complaint_precinct_code <chr>, patrol_borough_name <chr>,
#> #   county <chr>, law_code_category_description <chr>,
#> #   offense_description <chr>, pd_code_description <chr>,
#> #   bias_motive_description <chr>, offense_category <chr>, arrest_id <chr>
nyc_nypd_hate_crimes(filters = list(county = "KINGS"))
#> # A tibble: 1,360 × 13
#>    full_complaint_id complaint_year_number month_number record_create_date     
#>    <chr>             <chr>                 <chr>        <chr>                  
#>  1 202509412490517   2025                  9            2025-09-30T00:00:00.000
#>  2 202509012669817   2025                  9            2025-09-29T00:00:00.000
#>  3 202507012783417   2025                  9            2025-09-26T00:00:00.000
#>  4 202506612542317   2025                  9            2025-09-18T00:00:00.000
#>  5 202506012823917   2025                  9            2025-09-17T00:00:00.000
#>  6 202507812456917   2025                  9            2025-09-07T00:00:00.000
#>  7 202507912766217   2025                  8            2025-08-31T00:00:00.000
#>  8 202509012581917   2025                  8            2025-08-25T00:00:00.000
#>  9 202506012749417   2025                  8            2025-08-22T00:00:00.000
#> 10 202507012684817   2025                  8            2025-08-21T00:00:00.000
#> # ℹ 1,350 more rows
#> # ℹ 9 more variables: complaint_precinct_code <chr>, patrol_borough_name <chr>,
#> #   county <chr>, law_code_category_description <chr>,
#> #   offense_description <chr>, pd_code_description <chr>,
#> #   bias_motive_description <chr>, offense_category <chr>, arrest_id <chr>
# }
```
