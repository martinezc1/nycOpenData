# NYC Civil Service List (Active)

Downloads Civil Service List (Active) data from NYC Open Data.

## Usage

``` r
nyc_civil_service_list(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/vx8i-nprf\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Civil Service List (Active) data.

## Details

This dataset provides information about active Civil Service lists,
including eligible candidates, examination numbers, and certification
status. Published by the NYC Department of Citywide Administrative
Services (DCAS).

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_civil_service_list(limit = 10)
head(small_sample)
#> # A tibble: 6 × 15
#>   exam_no list_no first_name mi    last_name      adj_fa list_title_code
#>   <chr>   <chr>   <chr>      <chr> <chr>          <chr>  <chr>          
#> 1 3043    412     NESTOR     E     ROBLES         78.75  60888          
#> 2 5554    7       ROD        NA    MICHAEL        100    10020          
#> 3 5065    342     MELANIE    N     MARTINEZ       100    10104          
#> 4 3331    1349    CALIXTO    NA    AREVALO PINEDA 88.02  70210          
#> 5 3116    1212    SVETLANA   NA    SHVETSOVA      87.5   12626          
#> 6 3320    328     GABRIELA   NA    HIPOLITO       85.45  60817          
#> # ℹ 8 more variables: list_title_desc <chr>, group_no <chr>,
#> #   list_agency_code <chr>, list_agency_desc <chr>, established_date <chr>,
#> #   anniversary_date <chr>, extension_date <chr>, residency_credit <chr>

# \donttest{
nyc_civil_service_list(limit = 5000)
#> # A tibble: 5,000 × 18
#>    exam_no list_no first_name mi    last_name      adj_fa list_title_code
#>    <chr>   <chr>   <chr>      <chr> <chr>          <chr>  <chr>          
#>  1 3043    412     NESTOR     E     ROBLES         78.75  60888          
#>  2 5554    7       ROD        NA    MICHAEL        100    10020          
#>  3 5065    342     MELANIE    N     MARTINEZ       100    10104          
#>  4 3331    1349    CALIXTO    NA    AREVALO PINEDA 88.02  70210          
#>  5 3116    1212    SVETLANA   NA    SHVETSOVA      87.5   12626          
#>  6 3320    328     GABRIELA   NA    HIPOLITO       85.45  60817          
#>  7 0320    889     ADREAN     NA    CAZARES        98.58  70210          
#>  8 6601    27735   TERENCE    NA    WEBSTER        80     91207          
#>  9 7604    9038    WILLETTE   NA    JENKINS        76.67  91211          
#> 10 6601    24821   JOY        J     WRIGHT         83.75  91207          
#> # ℹ 4,990 more rows
#> # ℹ 11 more variables: list_title_desc <chr>, group_no <chr>,
#> #   list_agency_code <chr>, list_agency_desc <chr>, established_date <chr>,
#> #   anniversary_date <chr>, extension_date <chr>, residency_credit <chr>,
#> #   veteran_credit <chr>, sibling_lgy_credit <chr>, parent_lgy_credit <chr>
nyc_civil_service_list(filters = list(last_name = "Martinez"))
#> # A tibble: 0 × 0
# }
```
