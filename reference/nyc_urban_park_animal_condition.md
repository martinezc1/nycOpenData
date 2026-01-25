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

  nyc_urban_park_animal_condition(filters = list(age = "Infant"))
}
#> # A tibble: 273 × 22
#>    date_and_time_of_initial date_and_time_of_ranger borough    property location
#>    <chr>                    <chr>                   <chr>      <chr>    <chr>   
#>  1 2023-06-29T14:00:00.000  2023-06-29T14:00:00.000 Bronx      Crotona… In fron…
#>  2 2023-06-25T12:45:00.000  2023-06-25T13:00:00.000 Manhattan  J. Hood… 174 Str…
#>  3 2023-06-25T11:15:00.000  2023-06-25T11:16:00.000 Staten Is… Blue He… On the …
#>  4 2023-06-24T11:00:00.000  2023-06-24T11:00:00.000 Brooklyn   Prospec… South s…
#>  5 2023-06-19T19:33:00.000  2023-06-20T12:20:00.000 Bronx      Crotona… norther…
#>  6 2023-06-15T12:00:00.000  2023-06-15T12:00:00.000 Brooklyn   Prospec… Behind …
#>  7 2023-06-15T10:00:00.000  2023-06-15T10:30:00.000 Bronx      Van Cor… Pool    
#>  8 2023-06-11T14:10:00.000  2023-06-11T14:30:00.000 Staten Is… Blue He… Eyeland…
#>  9 2023-06-11T11:00:00.000  2023-06-11T11:20:00.000 Bronx      Pelham … Orchard…
#> 10 2023-06-05T12:00:00.000  2023-06-05T12:00:00.000 Brooklyn   Bushwic… Bushwic…
#> # ℹ 263 more rows
#> # ℹ 17 more variables: species_description <chr>, call_source <chr>,
#> #   species_status <chr>, animal_condition <chr>, duration_of_response <chr>,
#> #   age <chr>, animal_class <chr>, final_ranger_action <chr>, of_animals <chr>,
#> #   pep_response <lgl>, animal_monitored <lgl>, police_response <lgl>,
#> #   esu_response <lgl>, `_311sr_number` <chr>, rehabilitator <chr>,
#> #   hours_spent_monitoring <chr>, acc_intake_number <chr>
# }
```
