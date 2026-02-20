# NYC DOP Juvenile Rearrest Rate (Monthly Average)

Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC
Open Data.

## Usage

``` r
nyc_dop_juvenile_rearrest_rate(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/c87b-2j3i\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average)
data.

## Details

This dataset provides the average monthly rate of juvenile rearrests
reported by the NYC Department of Probation (DOP). Data includes region,
year, and monthly averages, allowing for trend analysis across boroughs.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 2)
  small_sample

  nyc_dop_juvenile_rearrest_rate(limit = 2, filters = list(borough = "Citywide"))
}
```
