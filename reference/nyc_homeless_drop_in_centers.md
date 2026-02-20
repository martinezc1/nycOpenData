# NYC Homeless Drop- In Centers

Directory Of Homeless Drop- In Centers

## Usage

``` r
nyc_homeless_drop_in_centers(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Directory-Of-Homeless-Drop-In-Centers/bmxf-3rd4/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Directory Of Homeless Drop- In Centers data.

## Details

List of centers where homeless people are provided with hot meals,
showers, medical help and a place to sleep

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_homeless_drop_in_centers(limit = 2)
  small_sample

  nyc_homeless_drop_in_centers(limit = 2, filters = list(borough = "Bronx"))
}
```
