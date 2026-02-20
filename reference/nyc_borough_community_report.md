# NYC Borough/Community District Report

Downloads Borough/Community District Report data from NYC Open Data.

## Usage

``` r
nyc_borough_community_report(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/5awp-wfkt\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Borough/Community District Report data.

## Details

This dataset provides monthly reports by borough and community district,
covering metrics such as service requests, inspections, and community
outreach. It’s published by NYC Department of Social Services for
transparency and analysis.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_borough_community_report(limit = 2)
  small_sample

  nyc_borough_community_report(limit = 2, filters = list(borough = "Bronx"))
}
```
