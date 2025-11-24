# NYC DOP Juvenile Case Count By Type

Downloads DOP Juvenile Case Count By Type data from NYC Open Data.

## Usage

``` r
nyc_dop_Juvenile_cases(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/c49b-3kmd\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing DOP Juvenile Case Count By Type data.

## Details

This dataset tracks the number of juvenile cases handled by the NYC
Department of Probation (DOP), broken down by case type and region. It
provides insight into trends in youth justice and probation supervision
citywide.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_dop_Juvenile_cases(limit = 10)
head(small_sample)
#> # A tibble: 6 × 5
#>   borough  supervision_caseload_type          month year  supervision_caseload…¹
#>   <chr>    <chr>                              <chr> <chr> <chr>                 
#> 1 Citywide Juvenile Justice Initiative        Sept… 2025  128                   
#> 2 Citywide Every Child Has An Opportunity To… Sept… 2025  8                     
#> 3 Citywide Pathways to Excellence Achievemen… Sept… 2025  0                     
#> 4 Citywide IMPACT                             Sept… 2025  0                     
#> 5 Citywide Advocate Intervene Mentor          Sept… 2025  39                    
#> 6 Citywide General Supervision                Sept… 2025  661                   
#> # ℹ abbreviated name: ¹​supervision_caseload_count

# \donttest{
nyc_dop_Juvenile_cases(limit = 5000)
#> # A tibble: 565 × 5
#>    borough  supervision_caseload_type         month year  supervision_caseload…¹
#>    <chr>    <chr>                             <chr> <chr> <chr>                 
#>  1 Citywide Juvenile Justice Initiative       Sept… 2025  128                   
#>  2 Citywide Every Child Has An Opportunity T… Sept… 2025  8                     
#>  3 Citywide Pathways to Excellence Achieveme… Sept… 2025  0                     
#>  4 Citywide IMPACT                            Sept… 2025  0                     
#>  5 Citywide Advocate Intervene Mentor         Sept… 2025  39                    
#>  6 Citywide General Supervision               Sept… 2025  661                   
#>  7 Citywide Enhanced Supervision Program      Sept… 2025  278                   
#>  8 Citywide Every Child Has An Opportunity T… Augu… 2025  8                     
#>  9 Citywide Juvenile Justice Initiative       Augu… 2025  123                   
#> 10 Citywide Pathways to Excellence Achieveme… Augu… 2025  0                     
#> # ℹ 555 more rows
#> # ℹ abbreviated name: ¹​supervision_caseload_count
nyc_dop_Juvenile_cases(filters = list(borough = "Citywide"))
#> # A tibble: 565 × 5
#>    borough  supervision_caseload_type         month year  supervision_caseload…¹
#>    <chr>    <chr>                             <chr> <chr> <chr>                 
#>  1 Citywide Juvenile Justice Initiative       Sept… 2025  128                   
#>  2 Citywide Every Child Has An Opportunity T… Sept… 2025  8                     
#>  3 Citywide Pathways to Excellence Achieveme… Sept… 2025  0                     
#>  4 Citywide IMPACT                            Sept… 2025  0                     
#>  5 Citywide Advocate Intervene Mentor         Sept… 2025  39                    
#>  6 Citywide General Supervision               Sept… 2025  661                   
#>  7 Citywide Enhanced Supervision Program      Sept… 2025  278                   
#>  8 Citywide Every Child Has An Opportunity T… Augu… 2025  8                     
#>  9 Citywide Juvenile Justice Initiative       Augu… 2025  123                   
#> 10 Citywide Pathways to Excellence Achieveme… Augu… 2025  0                     
#> # ℹ 555 more rows
#> # ℹ abbreviated name: ¹​supervision_caseload_count
# }
```
