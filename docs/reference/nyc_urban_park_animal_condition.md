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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_urban_park_animal_condition(limit = 2)
  small_sample

  nyc_urban_park_animal_condition(limit = 2, filters = list(age = "Infant"))
}
#> # A tibble: 2 × 20
#>   date_and_time_of_initial date_and_time_of_ranger borough   property   location
#>   <chr>                    <chr>                   <chr>     <chr>      <chr>   
#> 1 2023-06-29T14:00:00.000  2023-06-29T14:00:00.000 Bronx     Crotona P… In fron…
#> 2 2023-06-25T12:45:00.000  2023-06-25T13:00:00.000 Manhattan J. Hood W… 174 Str…
#> # ℹ 15 more variables: species_description <chr>, call_source <chr>,
#> #   species_status <chr>, animal_condition <chr>, duration_of_response <chr>,
#> #   age <chr>, animal_class <chr>, final_ranger_action <chr>, of_animals <chr>,
#> #   pep_response <lgl>, animal_monitored <lgl>, police_response <lgl>,
#> #   esu_response <lgl>, `_311sr_number` <chr>, rehabilitator <chr>
# }
```
