# NYC Detention Admissions by Community District

Downloads Detention Admissions by Community District data from NYC Open
Data.

## Usage

``` r
nyc_detention_admissions(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/2hrw-qfsu\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing NYC Detention Admissions by Community District data.

## Details

This dataset reports annual counts of detention admissions across NYC
community districts, disaggregated by borough and calendar year.
Provided by the NYC Department of Correction and Department of Youth and
Community Development.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_detention_admissions(limit = 10)
head(small_sample)
#> # A tibble: 6 × 4
#>   calendar_year borough borough_cd                      number_admitted
#>   <chr>         <chr>   <chr>                           <chr>          
#> 1 2024          BRONX   BX01 Mott Haven/Melrose         72             
#> 2 2024          BRONX   BX02 Hunts Point/Longwood       30             
#> 3 2024          BRONX   BX03 Morrisania/Crotona         58             
#> 4 2024          BRONX   BX04 Highbridge/Concourse       55             
#> 5 2024          BRONX   BX05 Fordham/University Heights 64             
#> 6 2024          BRONX   BX06 Belmont/East Tremont       79             

# \donttest{
nyc_detention_admissions(limit = 5000)
#> # A tibble: 390 × 4
#>    calendar_year borough borough_cd                            number_admitted
#>    <chr>         <chr>   <chr>                                 <chr>          
#>  1 2024          BRONX   BX01 Mott Haven/Melrose               72             
#>  2 2024          BRONX   BX02 Hunts Point/Longwood             30             
#>  3 2024          BRONX   BX03 Morrisania/Crotona               58             
#>  4 2024          BRONX   BX04 Highbridge/Concourse             55             
#>  5 2024          BRONX   BX05 Fordham/University Heights       64             
#>  6 2024          BRONX   BX06 Belmont/East Tremont             79             
#>  7 2024          BRONX   BX07 Kingsbridge Heights/Bedford Park 41             
#>  8 2024          BRONX   BX08 Riverdale/Fieldstone             21             
#>  9 2024          BRONX   BX09 Parkchester/Soundview            70             
#> 10 2024          BRONX   BX10 Throgs Neck/Co-op City           15             
#> # ℹ 380 more rows
nyc_detention_admissions(filters = list(borough = "Bronx"))
#> # A tibble: 0 × 0
# }
```
