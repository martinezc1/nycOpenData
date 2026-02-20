# NYC Urban Park Ranger Animal Condition Response

Downloads Urban Park Ranger Animal Condition Response data from NYC Open
Data.

## Usage

``` r
nyc_urban_park_animal_condition(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/fuhs-xmg2\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Urban Park Ranger Animal Condition Response data.

## Details

This dataset records responses by NYC Urban Park Rangers to
animal-related incidents across the five boroughs. It includes
information on species, condition, location, and outcome, helping to
monitor urban wildlife trends and public safety interactions.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_urban_park_animal_condition(limit = 2)
  small_sample

  nyc_urban_park_animal_condition(limit = 2, filters = list(age = "Infant"))
}
```
