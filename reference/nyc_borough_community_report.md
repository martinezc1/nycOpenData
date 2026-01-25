# NYC Borough/Community District Report

Downloads Borough/Community District Report data from NYC Open Data.

## Usage

``` r
nyc_borough_community_report(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/5awp-wfkt\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Borough/Community District Report data.

## Details

This dataset provides monthly reports by borough and community district,
covering metrics such as service requests, inspections, and community
outreach. It’s published by NYC Department of Social Services for
transparency and analysis.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_borough_community_report(limit = 2)
  head(small_sample)

  nyc_borough_community_report(filters = list(borough = "Bronx"))
}
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
