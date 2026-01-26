# NYC DOP Juvenile Case Count By Type

Downloads DOP Juvenile Case Count By Type data from NYC Open Data.

## Usage

``` r
nyc_dop_Juvenile_cases(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/c49b-3kmd\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing DOP Juvenile Case Count By Type data.

## Details

This dataset tracks the number of juvenile cases handled by the NYC
Department of Probation (DOP), broken down by case type and region. It
provides insight into trends in youth justice and probation supervision
citywide.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dop_Juvenile_cases(limit = 2)
  small_sample

  nyc_dop_Juvenile_cases(filters = list(borough = "Citywide"))
}
#> # A tibble: 579 × 5
#>    borough  supervision_caseload_type         month year  supervision_caseload…¹
#>    <chr>    <chr>                             <chr> <chr> <chr>                 
#>  1 Citywide Advocate Intervene Mentor         Nove… 2025  37                    
#>  2 Citywide Juvenile Justice Initiative       Nove… 2025  132                   
#>  3 Citywide Every Child Has An Opportunity T… Nove… 2025  3                     
#>  4 Citywide IMPACT                            Nove… 2025  0                     
#>  5 Citywide General Supervision               Nove… 2025  629                   
#>  6 Citywide Enhanced Supervision Program      Nove… 2025  294                   
#>  7 Citywide Pathways to Excellence Achieveme… Nove… 2025  0                     
#>  8 Citywide Enhanced Supervision Program      Octo… 2025  282                   
#>  9 Citywide Juvenile Justice Initiative       Octo… 2025  135                   
#> 10 Citywide Pathways to Excellence Achieveme… Octo… 2025  0                     
#> # ℹ 569 more rows
#> # ℹ abbreviated name: ¹​supervision_caseload_count
# }
```
