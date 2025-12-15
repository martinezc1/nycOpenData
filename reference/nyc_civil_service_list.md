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
#>   exam_no list_no first_name last_name   adj_fa list_title_code list_title_desc 
#>   <chr>   <chr>   <chr>      <chr>       <chr>  <chr>           <chr>           
#> 1 3317    329     IESHA      ELLIS       78     70410           CORRECTION OFFI…
#> 2 2611    720     ERIK       HAZEL       75     91203           BUS OPERATOR    
#> 3 2064    97      JESENIA    FARCIERT    79     55038           ASSOCIATE HUMAN…
#> 4 5045    740     MARTHA     KRAWCZYNSKI 70     22122           CITY PLANNER    
#> 5 6601    5025    LEON       HELGEROD    95     91207           CONDUCTOR       
#> 6 3116    2425    JONNELLE   MYRIE       75     12626           STAFF ANALYST   
#> # ℹ 8 more variables: group_no <chr>, list_agency_code <chr>,
#> #   list_agency_desc <chr>, established_date <chr>, anniversary_date <chr>,
#> #   mi <chr>, extension_date <chr>, veteran_credit <chr>

# \donttest{
nyc_civil_service_list(limit = 5000)
#> # A tibble: 5,000 × 18
#>    exam_no list_no first_name last_name   adj_fa list_title_code list_title_desc
#>    <chr>   <chr>   <chr>      <chr>       <chr>  <chr>           <chr>          
#>  1 3317    329     IESHA      ELLIS       78     70410           CORRECTION OFF…
#>  2 2611    720     ERIK       HAZEL       75     91203           BUS OPERATOR   
#>  3 2064    97      JESENIA    FARCIERT    79     55038           ASSOCIATE HUMA…
#>  4 5045    740     MARTHA     KRAWCZYNSKI 70     22122           CITY PLANNER   
#>  5 6601    5025    LEON       HELGEROD    95     91207           CONDUCTOR      
#>  6 3116    2425    JONNELLE   MYRIE       75     12626           STAFF ANALYST  
#>  7 5061    357     JAWAD      ATIF        97     13633           CYBER SECURITY…
#>  8 2614    60      LETASHA    WRIGHT      93     91203           BUS OPERATOR   
#>  9 5302    368     STEVEN     SONNICK     81     70410           CORRECTION OFF…
#> 10 6601    7021    ALEXANDRIA DEFARIA     94     91207           CONDUCTOR      
#> # ℹ 4,990 more rows
#> # ℹ 11 more variables: group_no <chr>, list_agency_code <chr>,
#> #   list_agency_desc <chr>, established_date <chr>, anniversary_date <chr>,
#> #   mi <chr>, extension_date <chr>, veteran_credit <chr>,
#> #   residency_credit <chr>, sibling_lgy_credit <chr>, parent_lgy_credit <chr>
nyc_civil_service_list(filters = list(last_name = "Martinez"))
#> # A tibble: 0 × 0
# }
```
