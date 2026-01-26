# Load Any NYC Open Data Dataset

Downloads any NYC Open Data dataset given its Socrata JSON endpoint.

## Usage

``` r
nyc_any_dataset(json_link, limit = 10000, timeout_sec = 30)
```

## Arguments

- json_link:

  A Socrata dataset JSON endpoint URL (e.g.,
  "https://data.cityofnewyork.us/resource/abcd-1234.json").

- limit:

  Number of rows to retrieve (default = 10,000).

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing the requested dataset.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"
  out <- try(nyc_any_dataset(endpoint, limit = 3), silent = TRUE)
  if (!inherits(out, "try-error")) {
    head(out)
  }
}
#> # A tibble: 3 × 24
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67603407   2026-01-25T02:47:41.0… DOT    Department… Street Condit… Pothole   
#> 2 67602402   2026-01-25T02:46:50.0… DOT    Department… Street Condit… Pothole   
#> 3 67596744   2026-01-25T02:45:12.0… DOT    Department… Street Condit… Pothole   
#> # ℹ 18 more variables: incident_zip <chr>, incident_address <chr>,
#> #   street_name <chr>, cross_street_1 <chr>, cross_street_2 <chr>,
#> #   address_type <chr>, city <chr>, facility_type <chr>, status <chr>,
#> #   resolution_description <chr>, resolution_action_updated_date <chr>,
#> #   community_board <chr>, police_precinct <chr>, borough <chr>,
#> #   open_data_channel_type <chr>, park_facility_name <chr>, park_borough <chr>,
#> #   closed_date <chr>
# }
```
