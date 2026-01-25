# NYC Pets in Shelter Report

Local Law 97 of 2021 - Pets in Shelter Report from NYC Open Data.

## Usage

``` r
nyc_pets_in_shelters(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Local Law 97 of 2021 - Pets in Shelter Report data.

## Details

This quarterly report provides survey response data about the types of
pets whose owners enter homeless shelters. Data is aggregated at the
quarterly level (ie: 2024 Q3). The unit of analysis is a fiscal year
quarter: Quarter 1 (Q1): July - September; Quarter 2 (Q2): October -
December; Quarter 3 (Q3): January - March; Quarter 4 (Q4): April - June.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_pets_in_shelters(limit = 2)
  small_sample

  nyc_pets_in_shelters(filters = list(date_quarter = "Qtr 1"))
}
#> # A tibble: 3 × 24
#>   date_year date_quarter total_applicants had_pet client_borough_of_entry_bronx
#>   <chr>     <chr>        <chr>            <chr>   <chr>                        
#> 1 2026      Qtr 1        12062            16      16                           
#> 2 2025      Qtr 1        11901            2       2                            
#> 3 2024      Qtr 1        11651            3       2                            
#> # ℹ 19 more variables: client_borough_of_entry <chr>,
#> #   client_borough_of_entry_1 <chr>, clients_who_would_have_entered <chr>,
#> #   clients_choosing_to_forego <chr>, chose_to_forego_shelter_for <chr>,
#> #   clients_who_intend_to_regain <chr>, number_of_dogs <chr>,
#> #   number_of_cats <chr>, number_of_birds <chr>, number_of_small_mammals <chr>,
#> #   number_of_reptiles_small <chr>, number_of_fish <chr>,
#> #   did_not_report_pet_type <chr>, pet_s_placed_with_foster <chr>, …
# }
```
