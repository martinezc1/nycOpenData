# Film Permits

Downloads Film Permits data from NYC Open Data.

## Usage

``` r
nyc_film_permits(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Film Permits data.

## Details

Permits are generally required when asserting the exclusive use of city
property, like a sidewalk, a street, or a park. See
http://www1.nyc.gov/site/mome/permits/when-permit-required.page

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_film_permits(limit = 10)
head(small_sample)
#> # A tibble: 6 × 13
#>   eventid eventtype    startdatetime enddatetime eventagency parkingheld borough
#>   <chr>   <chr>        <chr>         <chr>       <chr>       <chr>       <chr>  
#> 1 896788  Shooting Pe… 2025-10-24T0… 2025-10-24… Mayor's Of… LAFAYETTE … Manhat…
#> 2 895804  Shooting Pe… 2025-10-23T0… 2025-10-23… Mayor's Of… MANHATTAN … Bronx  
#> 3 895813  Shooting Pe… 2025-10-23T0… 2025-10-23… Mayor's Of… LORIMER ST… Brookl…
#> 4 895465  Shooting Pe… 2025-10-21T0… 2025-10-22… Mayor's Of… KINGSLAND … Brookl…
#> 5 895316  Shooting Pe… 2025-10-21T0… 2025-10-21… Mayor's Of… WEST  118 … Manhat…
#> 6 894131  Theater Loa… 2025-10-21T1… 2025-10-21… Mayor's Of… DEKALB AVE… Brookl…
#> # ℹ 6 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>

# \donttest{
nyc_film_permits(limit = 5000)
#> # A tibble: 5,000 × 14
#>    eventid eventtype   startdatetime enddatetime eventagency parkingheld borough
#>    <chr>   <chr>       <chr>         <chr>       <chr>       <chr>       <chr>  
#>  1 896788  Shooting P… 2025-10-24T0… 2025-10-24… Mayor's Of… LAFAYETTE … Manhat…
#>  2 895804  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… MANHATTAN … Bronx  
#>  3 895813  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… LORIMER ST… Brookl…
#>  4 895465  Shooting P… 2025-10-21T0… 2025-10-22… Mayor's Of… KINGSLAND … Brookl…
#>  5 895316  Shooting P… 2025-10-21T0… 2025-10-21… Mayor's Of… WEST  118 … Manhat…
#>  6 894131  Theater Lo… 2025-10-21T1… 2025-10-21… Mayor's Of… DEKALB AVE… Brookl…
#>  7 894130  Theater Lo… 2025-10-20T1… 2025-10-20… Mayor's Of… DEKALB AVE… Brookl…
#>  8 743256  Shooting P… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#>  9 758109  Shooting P… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#> 10 894127  Theater Lo… 2025-10-19T1… 2025-10-19… Mayor's Of… DEKALB AVE… Brookl…
#> # ℹ 4,990 more rows
#> # ℹ 7 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>,
#> #   enteredon <chr>
nyc_film_permits(filters = list(eventtype = "Shooting Permit"))
#> # A tibble: 10,000 × 14
#>    eventid eventtype   startdatetime enddatetime eventagency parkingheld borough
#>    <chr>   <chr>       <chr>         <chr>       <chr>       <chr>       <chr>  
#>  1 896788  Shooting P… 2025-10-24T0… 2025-10-24… Mayor's Of… LAFAYETTE … Manhat…
#>  2 895804  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… MANHATTAN … Bronx  
#>  3 895813  Shooting P… 2025-10-23T0… 2025-10-23… Mayor's Of… LORIMER ST… Brookl…
#>  4 895465  Shooting P… 2025-10-21T0… 2025-10-22… Mayor's Of… KINGSLAND … Brookl…
#>  5 895316  Shooting P… 2025-10-21T0… 2025-10-21… Mayor's Of… WEST  118 … Manhat…
#>  6 743256  Shooting P… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#>  7 758109  Shooting P… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#>  8 816598  Shooting P… 2024-10-22T0… 2024-10-22… Mayor's Of… EAST   73 … Manhat…
#>  9 889096  Shooting P… 2025-09-15T0… 2025-09-15… Mayor's Of… EAST    9 … Manhat…
#> 10 894374  Shooting P… 2025-10-17T1… 2025-10-18… Mayor's Of… 5 AVENUE b… Manhat…
#> # ℹ 9,990 more rows
#> # ℹ 7 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>,
#> #   enteredon <chr>
# }
```
