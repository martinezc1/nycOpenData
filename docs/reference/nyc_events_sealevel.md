# NYC Climate Projections: Extreme Events and Sea Level Rise

Downloads NYC Climate Projections data on extreme events (heatwaves,
degree days) and sea level rise.

## Usage

``` r
nyc_events_sealevel(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/38ps-fnsg\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing climate projection extreme events and sea level rise
data.

## Details

This dataset reports projected extreme climate events and sea level rise
for New York City. Each row corresponds to a climate period (e.g.,
"Baseline", "2030s (10th Percentile)") and includes metrics such as
number of heatwaves per year, cooling/heating degree days, and projected
sea level rise. Researchers can use this data to analyze future climate
risks and trends in NYC.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  small_sample <- nyc_events_sealevel(limit = )
  small_sample

 nyc_events_sealevel(limit = 2, filters = list(sea_lelel_rise = "6 in"))
}
```
