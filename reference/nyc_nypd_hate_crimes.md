# NYC NYPD Hate Crimes

Downloads NYPD Hate Crimes data from NYC Open Data.

## Usage

``` r
nyc_nypd_hate_crimes(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/bqiq-cu78\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYC NYPD Hate Crimes data.

## Details

This dataset contains records of hate crime incidents reported by the
NYPD. Each entry includes the bias motivation, offense category, and
borough, providing insight into hate crime trends across New York City.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_nypd_hate_crimes(limit = 2)
  small_sample

  nyc_nypd_hate_crimes(limit = 2, filters = list(county = "KINGS"))
}
```
