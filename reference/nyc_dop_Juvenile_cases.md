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
#> 1 Citywide Enhanced Supervision Program       Octo… 2025  282                   
#> 2 Citywide Juvenile Justice Initiative        Octo… 2025  135                   
#> 3 Citywide Pathways to Excellence Achievemen… Octo… 2025  0                     
#> 4 Citywide IMPACT                             Octo… 2025  0                     
#> 5 Citywide Every Child Has An Opportunity To… Octo… 2025  6                     
#> 6 Citywide General Supervision                Octo… 2025  648                   
#> # ℹ abbreviated name: ¹​supervision_caseload_count

# \donttest{
nyc_dop_Juvenile_cases(limit = 5000)
#> # A tibble: 572 × 5
#>    borough  supervision_caseload_type         month year  supervision_caseload…¹
#>    <chr>    <chr>                             <chr> <chr> <chr>                 
#>  1 Citywide Enhanced Supervision Program      Octo… 2025  282                   
#>  2 Citywide Juvenile Justice Initiative       Octo… 2025  135                   
#>  3 Citywide Pathways to Excellence Achieveme… Octo… 2025  0                     
#>  4 Citywide IMPACT                            Octo… 2025  0                     
#>  5 Citywide Every Child Has An Opportunity T… Octo… 2025  6                     
#>  6 Citywide General Supervision               Octo… 2025  648                   
#>  7 Citywide Advocate Intervene Mentor         Octo… 2025  38                    
#>  8 Citywide Juvenile Justice Initiative       Sept… 2025  128                   
#>  9 Citywide Every Child Has An Opportunity T… Sept… 2025  8                     
#> 10 Citywide Pathways to Excellence Achieveme… Sept… 2025  0                     
#> # ℹ 562 more rows
#> # ℹ abbreviated name: ¹​supervision_caseload_count
nyc_dop_Juvenile_cases(filters = list(borough = "Citywide"))
#> # A tibble: 572 × 5
#>    borough  supervision_caseload_type         month year  supervision_caseload…¹
#>    <chr>    <chr>                             <chr> <chr> <chr>                 
#>  1 Citywide Juvenile Justice Initiative       Janu… 2025  110                   
#>  2 Citywide Enhanced Supervision Program      Octo… 2025  282                   
#>  3 Citywide Juvenile Justice Initiative       Octo… 2025  135                   
#>  4 Citywide Pathways to Excellence Achieveme… Octo… 2025  0                     
#>  5 Citywide IMPACT                            Octo… 2025  0                     
#>  6 Citywide Every Child Has An Opportunity T… Octo… 2025  6                     
#>  7 Citywide General Supervision               Octo… 2025  648                   
#>  8 Citywide Advocate Intervene Mentor         Octo… 2025  38                    
#>  9 Citywide Juvenile Justice Initiative       Sept… 2025  128                   
#> 10 Citywide Every Child Has An Opportunity T… Sept… 2025  8                     
#> # ℹ 562 more rows
#> # ℹ abbreviated name: ¹​supervision_caseload_count
# }
```
