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
# }
```
