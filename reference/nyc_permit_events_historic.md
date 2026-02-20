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
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  small_sample <- try(
    nyc_permit_events_historic(limit = 2, timeout_sec = 10),
    silent = TRUE
  )
  if (!inherits(small_sample, "try-error")) print(small_sample)

  filtered <- try(
    nyc_permit_events_historic(
      limit = 2,
      filters = list(event_type = "Construction"),
      timeout_sec = 10
    ),
    silent = TRUE
  )
  if (!inherits(filtered, "try-error")) print(filtered)
}
```
