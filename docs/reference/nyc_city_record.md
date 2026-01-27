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
  # Quick example (fetch 2 rows)
  small_sample <- nyc_city_record(limit = 2)
  small_sample

  nyc_city_record(limit = 2, filters = list(short_title = "APPOINTED"))
}
#> # A tibble: 2 × 7
#>   request_id start_date            end_date agency_name short_title section_name
#>   <chr>      <chr>                 <chr>    <chr>       <chr>       <chr>       
#> 1 953050     2025-11-07T00:00:00.… 2025-10… COMMUNITY … APPOINTED   Changes in …
#> 2 953231     2025-11-07T00:00:00.… 2025-10… DEPARTMENT… APPOINTED   Changes in …
#> # ℹ 1 more variable: additional_description_1 <chr>
# }
```
