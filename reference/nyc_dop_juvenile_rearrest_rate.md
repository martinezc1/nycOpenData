# NYC DOP Juvenile Rearrest Rate (Monthly Average)

Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC
Open Data.

## Usage

``` r
nyc_dop_juvenile_rearrest_rate(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/c87b-2j3i\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average)
data.

## Details

This dataset provides the average monthly rate of juvenile rearrests
reported by the NYC Department of Probation (DOP). Data includes region,
year, and monthly averages, allowing for trend analysis across boroughs.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 10)
head(small_sample)
#> # A tibble: 6 × 4
#>   borough  month     year  rate 
#>   <chr>    <chr>     <chr> <chr>
#> 1 Citywide September 2025  4.9  
#> 2 Citywide August    2025  4.1  
#> 3 Citywide July      2025  4.7  
#> 4 Citywide June      2025  4.7  
#> 5 Citywide May       2025  4.4  
#> 6 Citywide April     2025  4.4  

# \donttest{
nyc_dop_juvenile_rearrest_rate(limit = 5000)
#> # A tibble: 115 × 4
#>    borough  month     year  rate 
#>    <chr>    <chr>     <chr> <chr>
#>  1 Citywide September 2025  4.9  
#>  2 Citywide August    2025  4.1  
#>  3 Citywide July      2025  4.7  
#>  4 Citywide June      2025  4.7  
#>  5 Citywide May       2025  4.4  
#>  6 Citywide April     2025  4.4  
#>  7 Citywide March     2025  4.3  
#>  8 Citywide February  2025  4.1  
#>  9 Citywide January   2025  4    
#> 10 Citywide December  2024  4    
#> # ℹ 105 more rows
nyc_dop_juvenile_rearrest_rate(filters = list(borough = "Citywide"))
#> # A tibble: 115 × 4
#>    borough  month     year  rate 
#>    <chr>    <chr>     <chr> <chr>
#>  1 Citywide September 2025  4.9  
#>  2 Citywide August    2025  4.1  
#>  3 Citywide July      2025  4.7  
#>  4 Citywide June      2025  4.7  
#>  5 Citywide May       2025  4.4  
#>  6 Citywide April     2025  4.4  
#>  7 Citywide March     2025  4.3  
#>  8 Citywide February  2025  4.1  
#>  9 Citywide January   2025  4    
#> 10 Citywide December  2024  4    
#> # ℹ 105 more rows
# }
```
