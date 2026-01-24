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
#>   exam_no list_no first_name mi    last_name       adj_fa list_title_code
#>   <chr>   <chr>   <chr>      <chr> <chr>           <chr>  <chr>          
#> 1 9086    854     EMEEL      S     FALTAS          78     81805          
#> 2 4044    501     DIWANI     M     WILES-SINGLETAR 107    70310          
#> 3 5333    561     QUEEN-ASIA S     DAVIS           94     70210          
#> 4 0144    1456    SEAN       NA    WILLIAMS        88     71012          
#> 5 3072    302     CADEDRA    D     WATSON          100    10144          
#> 6 6311    1198    LIAM       NA    HOLMES          87     70210          
#> # ℹ 8 more variables: list_title_desc <chr>, group_no <chr>,
#> #   list_agency_code <chr>, list_agency_desc <chr>, established_date <chr>,
#> #   anniversary_date <chr>, veteran_credit <chr>, residency_credit <chr>

# \donttest{
nyc_civil_service_list(limit = 5000)
#> # A tibble: 5,000 × 18
#>    exam_no list_no first_name mi    last_name       adj_fa list_title_code
#>    <chr>   <chr>   <chr>      <chr> <chr>           <chr>  <chr>          
#>  1 9086    854     EMEEL      S     FALTAS          78     81805          
#>  2 4044    501     DIWANI     M     WILES-SINGLETAR 107    70310          
#>  3 5333    561     QUEEN-ASIA S     DAVIS           94     70210          
#>  4 0144    1456    SEAN       NA    WILLIAMS        88     71012          
#>  5 3072    302     CADEDRA    D     WATSON          100    10144          
#>  6 6311    1198    LIAM       NA    HOLMES          87     70210          
#>  7 2064    39      SHELLEY    NA    LUONG           86     55038          
#>  8 3304    264     AALIYAH    J     ANDERSON        84     60817          
#>  9 4022    479     DEMETRIC   NA    HOLMES          74     10260          
#> 10 4041    313     OLIVIA     NA    TIWARI          77     53053          
#> # ℹ 4,990 more rows
#> # ℹ 11 more variables: list_title_desc <chr>, group_no <chr>,
#> #   list_agency_code <chr>, list_agency_desc <chr>, established_date <chr>,
#> #   anniversary_date <chr>, veteran_credit <chr>, residency_credit <chr>,
#> #   extension_date <chr>, parent_lgy_credit <chr>, sibling_lgy_credit <chr>
nyc_civil_service_list(filters = list(last_name = "Martinez"))
#> # A tibble: 0 × 0
# }
```
