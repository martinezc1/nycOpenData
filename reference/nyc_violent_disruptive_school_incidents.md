# NYC Violent and Disruptive Incidents

Downloads Violent and Disruptive Incidents data from NYC Open Data.

## Usage

``` r
nyc_violent_disruptive_school_incidents(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/fpci-ws56\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Violent and Disruptive Incidents data.

## Details

Incident counts and rates reported by NYC schools, broken out by
incident category, school, and school year. Useful for safety trend
analyses and comparisons across school types.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_violent_disruptive_school_incidents(limit = 2)
  small_sample

  nyc_violent_disruptive_school_incidents(filters = list(school_type = "Public"))
}
#> # A tibble: 10,000 × 45
#>    school_year beds_code    school_name     district_name school_type enrollment
#>    <chr>       <chr>        <chr>           <chr>         <chr>       <chr>     
#>  1 2014-2015   353100010075 Is 75 Frank D … New York Cit… Public      1357      
#>  2 2014-2015   353100010063 Marsh Avenue S… New York Cit… Public      443       
#>  3 2014-2015   353100011080 Michael J Petr… New York Cit… Public      1323      
#>  4 2014-2015   353100010009 Naples Street … New York Cit… Public      150       
#>  5 2014-2015   353100011440 New Dorp High … New York Cit… Public      2785      
#>  6 2014-2015   353100011445 Port Richmond … New York Cit… Public      1603      
#>  7 2014-2015   353100010001 Ps 1 Tottenvil… New York Cit… Public      523       
#>  8 2014-2015   353100010011 Ps 11 Thomas D… New York Cit… Public      281       
#>  9 2014-2015   353100010013 Ps 13 M L Lind… New York Cit… Public      858       
#> 10 2014-2015   353100010016 Ps 16 John J D… New York Cit… Public      617       
#> # ℹ 9,990 more rows
#> # ℹ 39 more variables: homicide_with_weapon_s <chr>,
#> #   homicide_without_weapon_s <chr>, forcible_sex_offenses_with <chr>,
#> #   forcible_sex_offenses_without <chr>, other_sex_offenses_with_weapon <chr>,
#> #   other_sex_offenses_without <chr>, robbery_with_weapon_s <chr>,
#> #   robbery_without_weapon_s <chr>, assault_with_serious_physical <chr>,
#> #   assault_with_serious_physical_1 <chr>, arson_with_weapon_s <chr>, …
# }
```
