# NYC Permitted Event Information - Historical

Downloads historical permitted event data from NYC Open Data.

## Usage

``` r
nyc_permit_events_historic(limit = 10000, filters = list(), timeout_sec = 60)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/bkfu-528j\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 60).

## Value

A tibble containing NYC Permitted Event Information - Historical data.

## Details

This dataset includes historical information about events permitted
through the Office of Citywide Event Coordination and Management (CECM),
including parades, festivals, street fairs, and other public gatherings.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_permit_events_historic(limit = 2)
  small_sample

  nyc_permit_events_historic(limit = 2, filters = list(event_type = "Construction"))
}
#> Error: NYC Open Data request failed (network unavailable or API slow).
#> Try again later or increase `timeout_sec`.
#> 
#> Underlying error: Timeout was reached [data.cityofnewyork.us]:
#> Operation timed out after 60002 milliseconds with 0 bytes received
# }
```
