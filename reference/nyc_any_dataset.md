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
#> # A tibble: 3 × 36
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67591844   2026-01-24T02:05:45.0… NYPD   New York C… Noise - Resid… Loud Talk…
#> 2 67590426   2026-01-24T02:05:27.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 3 67583315   2026-01-24T02:04:34.0… NYPD   New York C… Noise - Resid… Banging/P…
#> # ℹ 30 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …
# }
```
