# Film Permits

Downloads Film Permits data from NYC Open Data.

## Usage

``` r
nyc_film_permits(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Film Permits data.

## Details

Permits are generally required when asserting the exclusive use of city
property, like a sidewalk, a street, or a park. See
http://www1.nyc.gov/site/mome/permits/when-permit-required.page

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_film_permits(limit = 2)
  small_sample

  nyc_film_permits(limit = 2, filters = list(eventtype = "Shooting Permit"))
}
```
