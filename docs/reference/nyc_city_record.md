# City Record Online

Downloads City Record Online data from NYC Open Data.

## Usage

``` r
nyc_city_record(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/City-Record-Online/dg92-zbpx/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing City Record Online data.

## Details

The City Record Online (CROL) is a fully searchable database of notices
published in the City Record newspaper, including, but not limited to:
public hearings and meetings, public auctions and sales, solicitations
and awards and official rules proposed and adopted by city agencies.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 10 rows)
  small_sample <- nyc_city_record(limit = 10)
  head(small_sample)

  nyc_city_record(limit = 5000)
  nyc_city_record(filters = list(short_title = "APPOINTED"))
}
#> # A tibble: 10,000 × 7
#>    request_id start_date           end_date agency_name short_title section_name
#>    <chr>      <chr>                <chr>    <chr>       <chr>       <chr>       
#>  1 951950     2025-11-07T00:00:00… 2025-10… DEPARTMENT… APPOINTED   Changes in …
#>  2 951790     2025-11-07T00:00:00… 2025-10… MAYORS OFF… APPOINTED   Changes in …
#>  3 951921     2025-11-07T00:00:00… 2025-10… TAXI & LIM… APPOINTED   Changes in …
#>  4 951717     2025-11-07T00:00:00… 2025-10… HRA/DEPT O… APPOINTED   Changes in …
#>  5 951798     2025-11-07T00:00:00… 2025-10… FIRE DEPAR… APPOINTED   Changes in …
#>  6 951754     2025-11-07T00:00:00… 2025-10… FIRE DEPAR… APPOINTED   Changes in …
#>  7 952023     2025-11-07T00:00:00… 2025-10… FIRE DEPAR… APPOINTED   Changes in …
#>  8 951867     2025-11-07T00:00:00… 2025-10… FIRE DEPAR… APPOINTED   Changes in …
#>  9 951835     2025-11-07T00:00:00… 2025-10… DEPT. OF H… APPOINTED   Changes in …
#> 10 951769     2025-11-07T00:00:00… 2025-10… FIRE DEPAR… APPOINTED   Changes in …
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: additional_description_1 <chr>
# }
```
