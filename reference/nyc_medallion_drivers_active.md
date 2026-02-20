# Medallion Drivers - Active

Downloads Medallion Drivers - Active data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_active(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Medallion Drivers - Active data.

## Details

This is a list of drivers with a current TLC Driver License, which
authorizes drivers to operate NYC TLC licensed yellow and green taxicabs
and for-hire vehicles (FHVs). This list is accurate as of the date and
time shown in the Last Date Updated and Last Time Updated fields.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_medallion_drivers_active(limit = 2)
  small_sample

  nyc_medallion_drivers_active(
    limit = 2,
    filters = list(type = "MEDALLION TAXI DRIVER")
  )
}
```
