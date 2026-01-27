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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_film_permits(limit = 2)
  small_sample

  nyc_film_permits(limit = 2, filters = list(eventtype = "Shooting Permit"))
}
#> # A tibble: 2 × 13
#>   eventid eventtype    startdatetime enddatetime eventagency parkingheld borough
#>   <chr>   <chr>        <chr>         <chr>       <chr>       <chr>       <chr>  
#> 1 897040  Shooting Pe… 2025-10-28T1… 2025-10-29… Mayor's Of… EAST   27 … Manhat…
#> 2 896782  Shooting Pe… 2025-10-27T0… 2025-10-27… Mayor's Of… EAST   69 … Manhat…
#> # ℹ 6 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>
# }
```
