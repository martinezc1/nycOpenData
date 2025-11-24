# NYC Urban Park Ranger Animal Condition Response

Downloads Urban Park Ranger Animal Condition Response data from NYC Open
Data.

## Usage

``` r
nyc_urban_park_animal_condition(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/fuhs-xmg2\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Urban Park Ranger Animal Condition Response data.

## Details

This dataset records responses by NYC Urban Park Rangers to
animal-related incidents across the five boroughs. It includes
information on species, condition, location, and outcome, helping to
monitor urban wildlife trends and public safety interactions.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_urban_park_animal_condition(limit = 10)
head(small_sample)
#> # A tibble: 6 × 21
#>   date_and_time_of_initial date_and_time_of_ranger borough   property   location
#>   <chr>                    <chr>                   <chr>     <chr>      <chr>   
#> 1 2024-06-29T18:00:00.000  2024-06-30T10:00:00.000 Brooklyn  Marine Pa… Burnet …
#> 2 2024-06-29T15:10:00.000  2024-06-29T15:15:00.000 Brooklyn  Marine Pa… Burnett…
#> 3 2024-06-29T09:20:00.000  2024-06-29T09:30:00.000 Queens    Forest Pa… K9 Korr…
#> 4 2024-06-28T17:00:00.000  2024-06-28T18:00:00.000 Manhattan Central P… Central…
#> 5 2024-06-28T16:40:00.000  2024-06-28T17:00:00.000 Manhattan Central P… Turtle …
#> 6 2024-06-28T11:30:00.000  2024-06-28T11:30:00.000 Manhattan Central P… 96st Re…
#> # ℹ 16 more variables: species_description <chr>, call_source <chr>,
#> #   species_status <chr>, animal_condition <chr>, duration_of_response <chr>,
#> #   age <chr>, animal_class <chr>, final_ranger_action <chr>, of_animals <chr>,
#> #   pep_response <lgl>, animal_monitored <lgl>, police_response <lgl>,
#> #   esu_response <lgl>, `_311sr_number` <chr>, acc_intake_number <chr>,
#> #   hours_spent_monitoring <chr>

# \donttest{
nyc_urban_park_animal_condition(limit = 5000)
#> # A tibble: 5,000 × 22
#>    date_and_time_of_initial date_and_time_of_ranger borough   property  location
#>    <chr>                    <chr>                   <chr>     <chr>     <chr>   
#>  1 2024-06-29T18:00:00.000  2024-06-30T10:00:00.000 Brooklyn  Marine P… Burnet …
#>  2 2024-06-29T15:10:00.000  2024-06-29T15:15:00.000 Brooklyn  Marine P… Burnett…
#>  3 2024-06-29T09:20:00.000  2024-06-29T09:30:00.000 Queens    Forest P… K9 Korr…
#>  4 2024-06-28T17:00:00.000  2024-06-28T18:00:00.000 Manhattan Central … Central…
#>  5 2024-06-28T16:40:00.000  2024-06-28T17:00:00.000 Manhattan Central … Turtle …
#>  6 2024-06-28T11:30:00.000  2024-06-28T11:30:00.000 Manhattan Central … 96st Re…
#>  7 2024-06-28T09:46:00.000  2024-06-28T10:00:00.000 Manhattan Central … Resevoi…
#>  8 2024-06-28T09:00:00.000  2024-06-28T09:07:00.000 Queens    Forest P… Jackson…
#>  9 2024-06-27T16:00:00.000  2024-06-27T04:20:00.000 Brooklyn  Betsy He… Women's…
#> 10 2024-06-27T16:00:00.000  2024-06-27T17:15:00.000 Manhattan Highbrid… By the …
#> # ℹ 4,990 more rows
#> # ℹ 17 more variables: species_description <chr>, call_source <chr>,
#> #   species_status <chr>, animal_condition <chr>, duration_of_response <chr>,
#> #   age <chr>, animal_class <chr>, final_ranger_action <chr>, of_animals <chr>,
#> #   pep_response <lgl>, animal_monitored <lgl>, police_response <lgl>,
#> #   esu_response <lgl>, `_311sr_number` <chr>, acc_intake_number <chr>,
#> #   hours_spent_monitoring <chr>, rehabilitator <chr>
nyc_urban_park_animal_condition(filters = list(age = "Infant"))
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
