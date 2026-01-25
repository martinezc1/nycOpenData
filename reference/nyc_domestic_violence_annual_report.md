# Annual Report on Domestic Violence Initiatives, Indicators and Factors

Downloads Annual Report on Domestic Violence Initiatives, Indicators and
Factors data from NYC Open Data.

## Usage

``` r
nyc_domestic_violence_annual_report(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Annual-Report-on-Domestic-Violence-Initiatives-Ind/7t9i-jsfp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Annual Report on Domestic Violence Initiatives,
Indicators and Factors data.

## Details

The information in the report is required under Local Law 38 of 2019.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_domestic_violence_annual_report(limit = 2)
  small_sample

  nyc_domestic_violence_annual_report(filters = list(category = "FJC_Client_Visits"))
}
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
