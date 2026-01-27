# MUSEUM

Downloads Locations of New York City Museums from NYC Open Data.

## Usage

``` r
nyc_museum_locations(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Recreation/MUSEUM/fn6f-htvy/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Locations of New York City Museums data.

## Details

Locations of New York City Museums

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_museum_locations(limit = 2)
  small_sample

  nyc_museum_locations(limit = 2, filters = list(city = "New York"))
}
#> # A tibble: 2 × 9
#>   name                    tel   url   adress1 address2 city  zip   the_geom.type
#>   <chr>                   <chr> <chr> <chr>   <chr>    <chr> <chr> <chr>        
#> 1 Alexander Hamilton U.S… (212… http… 1 Bowl… ""       New … 1000… Point        
#> 2 American Academy of Ar… (212… http… 633 W.… ""       New … 1003… Point        
#> # ℹ 1 more variable: the_geom.coordinates <list>
# }
```
