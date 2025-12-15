# Annual Report on Domestic Violence Initiatives, Indicators and Factors

Downloads Annual Report on Domestic Violence Initiatives, Indicators and
Factors data from NYC Open Data.

## Usage

``` r
nyc_domestic_violence_annual_report(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Annual-Report-on-Domestic-Violence-Initiatives-Ind/7t9i-jsfp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Annual Report on Domestic Violence Initiatives,
Indicators and Factors data.

## Details

The information in the report is required under Local Law 38 of 2019.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_domestic_violence_annual_report(limit = 10)
head(small_sample)
#> # A tibble: 6 × 8
#>   year  category          bronx brooklyn manhattan queens staten_island citywide
#>   <chr> <chr>             <chr> <chr>    <chr>     <chr>  <chr>         <chr>   
#> 1 2024  FJC_Client_Visits 10844 12860    11003     13421  9528          57,656  
#> 2 2024  FJC_Unique_Clien… 3007  4247     2688      3472   1793          15,207  
#> 3 2024  FJC_Unique_Clien… 4225  2839     2228      2659   1478          13429   
#> 4 2024  FJC_Unique_Clien… 2083  183      158       1377   442           4243    
#> 5 2024  FJC_Unique_Clien… 1094  1526     685       993    485           4793    
#> 6 2024  FJC_Unique_Clien… 584   729      822       547    271           2953    

# \donttest{
nyc_domestic_violence_annual_report(limit = 5000)
#> # A tibble: 265 × 8
#>    year  category         bronx brooklyn manhattan queens staten_island citywide
#>    <chr> <chr>            <chr> <chr>    <chr>     <chr>  <chr>         <chr>   
#>  1 2024  FJC_Client_Visi… 10844 12860    11003     13421  9528          57,656  
#>  2 2024  FJC_Unique_Clie… 3007  4247     2688      3472   1793          15,207  
#>  3 2024  FJC_Unique_Clie… 4225  2839     2228      2659   1478          13429   
#>  4 2024  FJC_Unique_Clie… 2083  183      158       1377   442           4243    
#>  5 2024  FJC_Unique_Clie… 1094  1526     685       993    485           4793    
#>  6 2024  FJC_Unique_Clie… 584   729      822       547    271           2953    
#>  7 2024  FJC_Unique_Clie… 360   1202     530       688    192           2972    
#>  8 2024  FJC_Unique_Clie… 300   321      148       349    230           1348    
#>  9 2024  FJC_Unique_Clie… 542   856      221       260    276           2155    
#> 10 2024  FJC_Unique_Clie… 85    171      84        73     88            501     
#> # ℹ 255 more rows
nyc_domestic_violence_annual_report(filters = list(category = "FJC_Client_Visits"))
#> # A tibble: 5 × 8
#>   year  category          bronx brooklyn manhattan queens staten_island citywide
#>   <chr> <chr>             <chr> <chr>    <chr>     <chr>  <chr>         <chr>   
#> 1 2024  FJC_Client_Visits 10844 12860    11003     13421  9528          57,656  
#> 2 2023  FJC_Client_Visits 11033 10492    8931      11906  6801          49,163  
#> 3 2022  FJC_Client_Visits 12188 11414    9028      11463  6705          50,798  
#> 4 2021  FJC_Client_Visits 7792  8267     7938      11955  6754          42,706  
#> 5 2020  FJC_Client_Visits 7602  9470     6857      12870  6535          43,334  
# }
```
