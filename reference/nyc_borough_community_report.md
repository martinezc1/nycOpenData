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
#> 1 2025-09-01T0… Staten… S03                14469              9014              
#> 2 2025-09-01T0… Staten… S02                19401              11080             
#> 3 2025-09-01T0… Staten… S01                41291              22547             
#> 4 2025-09-01T0… Queens  Q14                32329              18077             
#> 5 2025-09-01T0… Queens  Q13                24177              15506             
#> 6 2025-09-01T0… Queens  Q12                53866              32609             
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>

# \donttest{
nyc_borough_community_report(limit = 5000)
#> # A tibble: 1,711 × 9
#>    month        borough community_district bc_snap_recipients bc_snap_households
#>    <chr>        <chr>   <chr>              <chr>              <chr>             
#>  1 2025-09-01T… Staten… S03                14469              9014              
#>  2 2025-09-01T… Staten… S02                19401              11080             
#>  3 2025-09-01T… Staten… S01                41291              22547             
#>  4 2025-09-01T… Queens  Q14                32329              18077             
#>  5 2025-09-01T… Queens  Q13                24177              15506             
#>  6 2025-09-01T… Queens  Q12                53866              32609             
#>  7 2025-09-01T… Queens  Q11                10421              6997              
#>  8 2025-09-01T… Queens  Q10                19401              11975             
#>  9 2025-09-01T… Queens  Q09                26116              15665             
#> 10 2025-09-01T… Queens  Q08                23079              14038             
#> # ℹ 1,701 more rows
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>
nyc_borough_community_report(filters = list(borough = "Bronx"))
#> # A tibble: 348 × 9
#>    month        borough community_district bc_snap_recipients bc_snap_households
#>    <chr>        <chr>   <chr>              <chr>              <chr>             
#>  1 2025-09-01T… Bronx   B01                46014              26636             
#>  2 2025-09-01T… Bronx   B11                28792              16895             
#>  3 2025-09-01T… Bronx   B10                22567              13789             
#>  4 2025-09-01T… Bronx   B09                57656              33156             
#>  5 2025-09-01T… Bronx   B08                19702              12289             
#>  6 2025-09-01T… Bronx   B07                50067              30120             
#>  7 2025-09-01T… Bronx   B12                44754              25031             
#>  8 2025-09-01T… Bronx   B06                39878              23127             
#>  9 2025-09-01T… Bronx   B05                55868              33443             
#> 10 2025-09-01T… Bronx   B04                58144              34664             
#> # ℹ 338 more rows
#> # ℹ 4 more variables: bc_ca_recipients <chr>, bc_ca_cases <chr>,
#> #   bc_ma_only_enrollees <chr>, bc_total_ma_enrollees <chr>
# }
```
