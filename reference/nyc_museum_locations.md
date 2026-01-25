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

  nyc_museum_locations(filters = list(city = "New York"))
}
#> # A tibble: 89 × 9
#>    name                   tel   url   adress1 address2 city  zip   the_geom.type
#>    <chr>                  <chr> <chr> <chr>   <chr>    <chr> <chr> <chr>        
#>  1 Alexander Hamilton U.… "(21… http… 1 Bowl… ""       New … 1000… Point        
#>  2 American Academy of A… "(21… http… 633 W.… ""       New … 1003… Point        
#>  3 American Folk Art Mus… "(21… http… 45 Wes… ""       New … 1001… Point        
#>  4 American Immigration … "(21… http… Ellis … ""       New … 0.0   Point        
#>  5 American Museum of Na… "(21… http… Centra… ""       New … 1002… Point        
#>  6 American Numismatic S… "(21… http… 75 Var… "11th F… New … 1001… Point        
#>  7 Americas Society       "(21… http… 680 Pa… ""       New … 1002… Point        
#>  8 Anne Frank Center USA  "(21… http… 38 Cro… "5th Fl… New … 1001… Point        
#>  9 Asia Society           "(21… http… 725 Pa… ""       New … 1002… Point        
#> 10 Audubon Terrace        ""    http… Broadw… ""       New … 1003… Point        
#> # ℹ 79 more rows
#> # ℹ 1 more variable: the_geom.coordinates <list>
# }
```
