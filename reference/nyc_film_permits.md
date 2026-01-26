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

  nyc_film_permits(filters = list(eventtype = "Shooting Permit"))
}
#> # A tibble: 10,000 × 14
#>    eventid eventtype   startdatetime enddatetime eventagency parkingheld borough
#>    <chr>   <chr>       <chr>         <chr>       <chr>       <chr>       <chr>  
#>  1 896782  Shooting P… 2025-10-27T0… 2025-10-27… Mayor's Of… EAST   69 … Manhat…
#>  2 896788  Shooting P… 2025-10-24T0… 2025-10-24… Mayor's Of… LAFAYETTE … Manhat…
#>  3 895804  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… MANHATTAN … Bronx  
#>  4 895813  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… LORIMER ST… Brookl…
#>  5 895465  Shooting P… 2025-10-21T0… 2025-10-22… Mayor's Of… KINGSLAND … Brookl…
#>  6 895316  Shooting P… 2025-10-21T0… 2025-10-21… Mayor's Of… WEST  118 … Manhat…
#>  7 743256  Shooting P… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#>  8 758109  Shooting P… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#>  9 816598  Shooting P… 2024-10-22T0… 2024-10-22… Mayor's Of… EAST   73 … Manhat…
#> 10 889096  Shooting P… 2025-09-15T0… 2025-09-15… Mayor's Of… EAST    9 … Manhat…
#> # ℹ 9,990 more rows
#> # ℹ 7 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>,
#> #   enteredon <chr>
# }
```
