# NYC Borough/Community District Report

Downloads Borough/Community District Report data from NYC Open Data.

## Usage

``` r
nyc_borough_community_report(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/5awp-wfkt\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Borough/Community District Report data.

## Details

This dataset provides monthly reports by borough and community district,
covering metrics such as service requests, inspections, and community
outreach. It’s published by NYC Department of Social Services for
transparency and analysis.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_borough_community_report(limit = 10)
head(small_sample)
#> # A tibble: 6 × 9
#>   month         borough community_district bc_snap_recipients bc_snap_households
#>   <chr>         <chr>   <chr>              <chr>              <chr>             
#> 1 2025-12-01T0… Staten… S03                14183              8839              
#> 2 2025-12-01T0… Staten… S02                19167              10942             
#> 3 2025-12-01T0… Staten… S01                40297              22048             
#> 4 2025-12-01T0… Queens  Q14                31855              17882             
#> 5 2025-12-01T0… Queens  Q13                23342              15056             
#> 6 2025-12-01T0… Queens  Q12                52623              31973             
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>

# \donttest{
nyc_borough_community_report(limit = 5000)
#> # A tibble: 1,770 × 9
#>    month        borough community_district bc_snap_recipients bc_snap_households
#>    <chr>        <chr>   <chr>              <chr>              <chr>             
#>  1 2025-12-01T… Staten… S03                14183              8839              
#>  2 2025-12-01T… Staten… S02                19167              10942             
#>  3 2025-12-01T… Staten… S01                40297              22048             
#>  4 2025-12-01T… Queens  Q14                31855              17882             
#>  5 2025-12-01T… Queens  Q13                23342              15056             
#>  6 2025-12-01T… Queens  Q12                52623              31973             
#>  7 2025-12-01T… Queens  Q11                10275              6927              
#>  8 2025-12-01T… Queens  Q10                18859              11734             
#>  9 2025-12-01T… Queens  Q09                25156              15207             
#> 10 2025-12-01T… Queens  Q08                22605              13818             
#> # ℹ 1,760 more rows
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>
nyc_borough_community_report(filters = list(borough = "Bronx"))
#> # A tibble: 360 × 9
#>    month        borough community_district bc_snap_recipients bc_snap_households
#>    <chr>        <chr>   <chr>              <chr>              <chr>             
#>  1 2025-12-01T… Bronx   B01                45215              26196             
#>  2 2025-12-01T… Bronx   B12                43638              24470             
#>  3 2025-12-01T… Bronx   B11                28127              16578             
#>  4 2025-12-01T… Bronx   B10                22189              13580             
#>  5 2025-12-01T… Bronx   B09                56313              32554             
#>  6 2025-12-01T… Bronx   B08                19376              12128             
#>  7 2025-12-01T… Bronx   B07                48939              29663             
#>  8 2025-12-01T… Bronx   B06                39020              22745             
#>  9 2025-12-01T… Bronx   B05                54787              32897             
#> 10 2025-12-01T… Bronx   B04                56929              34071             
#> # ℹ 350 more rows
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>
# }
```
