# Medallion Vehicles - Authorized

Downloads Medallion Vehicles - Authorized data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_authorized(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Vehicles-Authorized/rhe8-mgbb/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Medallion Vehicles - Authorized data.

## Details

This dataset, which includes all TLC licensed medallion vehicles which
are in good standing and able to drive, is updated every day in the
evening between 4–7pm. Please check the 'Last Update Date' field to make
sure the list has updated successfully. 'Last Update Date' should show
either today or yesterday's date, depending on the time of day.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_medallion_drivers_authorized(limit = 2)
  small_sample

  nyc_medallion_drivers_authorized(limit = 2, filters = list(current_status = "CUR"))
}
```
