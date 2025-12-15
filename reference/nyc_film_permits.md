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
#> 1 743256  Shooting Pe… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#> 2 844261  DCAS Prep/S… 2025-03-28T0… 2025-03-28… Mayor's Of… CENTRE STR… Manhat…
#> 3 816598  Shooting Pe… 2024-10-22T0… 2024-10-22… Mayor's Of… EAST   73 … Manhat…
#> 4 758109  Shooting Pe… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#> 5 888508  Shooting Pe… 2025-09-11T0… 2025-09-11… Mayor's Of… 30 STREET … Queens 
#> 6 757141  Rigging Per… 2024-01-09T0… 2024-01-09… Mayor's Of… CALYER STR… Brookl…
#> # ℹ 6 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>

# \donttest{
nyc_film_permits(limit = 5000)
#> # A tibble: 5,000 × 14
#>    eventid eventtype   startdatetime enddatetime eventagency parkingheld borough
#>    <chr>   <chr>       <chr>         <chr>       <chr>       <chr>       <chr>  
#>  1 743256  Shooting P… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#>  2 844261  DCAS Prep/… 2025-03-28T0… 2025-03-28… Mayor's Of… CENTRE STR… Manhat…
#>  3 816598  Shooting P… 2024-10-22T0… 2024-10-22… Mayor's Of… EAST   73 … Manhat…
#>  4 758109  Shooting P… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#>  5 888508  Shooting P… 2025-09-11T0… 2025-09-11… Mayor's Of… 30 STREET … Queens 
#>  6 757141  Rigging Pe… 2024-01-09T0… 2024-01-09… Mayor's Of… CALYER STR… Brookl…
#>  7 752230  DCAS Prep/… 2023-12-07T0… 2023-12-07… Mayor's Of… WASHINGTON… Brookl…
#>  8 812898  Shooting P… 2024-10-02T0… 2024-10-02… Mayor's Of… STEWART AV… Brookl…
#>  9 819226  Rigging Pe… 2024-11-18T0… 2024-11-18… Mayor's Of… NORTH HENR… Brookl…
#> 10 703464  Rigging Pe… 2023-03-27T0… 2023-03-27… Mayor's Of… SHAKESPEAR… Bronx  
#> # ℹ 4,990 more rows
#> # ℹ 7 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>,
#> #   enteredon <chr>
nyc_film_permits(filters = list(eventtype = "Shooting Permit"))
#> # A tibble: 10,000 × 14
#>    eventid eventtype   startdatetime enddatetime eventagency parkingheld borough
#>    <chr>   <chr>       <chr>         <chr>       <chr>       <chr>       <chr>  
#>  1 743256  Shooting P… 2023-10-08T0… 2023-10-08… Mayor's Of… PEARL STRE… Manhat…
#>  2 816598  Shooting P… 2024-10-22T0… 2024-10-22… Mayor's Of… EAST   73 … Manhat…
#>  3 758109  Shooting P… 2024-01-17T0… 2024-01-17… Mayor's Of… RIVERSIDE … Manhat…
#>  4 888508  Shooting P… 2025-09-11T0… 2025-09-11… Mayor's Of… 30 STREET … Queens 
#>  5 812898  Shooting P… 2024-10-02T0… 2024-10-02… Mayor's Of… STEWART AV… Brookl…
#>  6 885169  Shooting P… 2025-08-27T0… 2025-08-27… Mayor's Of… ALLEN STRE… Manhat…
#>  7 719376  Shooting P… 2023-06-02T0… 2023-06-02… Mayor's Of… 3 AVENUE b… Manhat…
#>  8 769740  Shooting P… NA            2024-03-22… Mayor's Of… WEST   20 … Manhat…
#>  9 864270  Shooting P… 2025-06-02T0… 2025-06-02… Mayor's Of… EAST   80 … Manhat…
#> 10 786222  Shooting P… 2024-06-07T1… 2024-06-08… Mayor's Of… WEST MAIN … Manhat…
#> # ℹ 9,990 more rows
#> # ℹ 7 more variables: communityboard_s <chr>, policeprecinct_s <chr>,
#> #   category <chr>, subcategoryname <chr>, country <chr>, zipcode_s <chr>,
#> #   enteredon <chr>
# }
```
