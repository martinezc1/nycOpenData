# MUSEUM

Downloads Locations of New York City Museums from NYC Open Data.

## Usage

``` r
nyc_museum_locations(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Recreation/MUSEUM/fn6f-htvy/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Locations of New York City Museums data.

## Details

Locations of New York City Museums

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_museum_locations(limit = 10)
head(small_sample)
#> # A tibble: 6 × 9
#>   name                    tel   url   adress1 address2 city  zip   the_geom.type
#>   <chr>                   <chr> <chr> <chr>   <chr>    <chr> <chr> <chr>        
#> 1 Alexander Hamilton U.S… (212… http… 1 Bowl… ""       New … 1000… Point        
#> 2 Alice Austen House Mus… (718… http… 2 Hyla… ""       Stat… 1030… Point        
#> 3 American Academy of Ar… (212… http… 633 W.… ""       New … 1003… Point        
#> 4 American Folk Art Muse… (212… http… 45 Wes… ""       New … 1001… Point        
#> 5 American Immigration H… (212… http… Ellis … ""       New … 0.0   Point        
#> 6 American Museum of Nat… (212… http… Centra… ""       New … 1002… Point        
#> # ℹ 1 more variable: the_geom.coordinates <list>

# \donttest{
nyc_museum_locations(limit = 5000)
#> # A tibble: 130 × 9
#>    name                   tel   url   adress1 address2 city  zip   the_geom.type
#>    <chr>                  <chr> <chr> <chr>   <chr>    <chr> <chr> <chr>        
#>  1 Alexander Hamilton U.… (212… http… 1 Bowl… ""       New … 1000… Point        
#>  2 Alice Austen House Mu… (718… http… 2 Hyla… ""       Stat… 1030… Point        
#>  3 American Academy of A… (212… http… 633 W.… ""       New … 1003… Point        
#>  4 American Folk Art Mus… (212… http… 45 Wes… ""       New … 1001… Point        
#>  5 American Immigration … (212… http… Ellis … ""       New … 0.0   Point        
#>  6 American Museum of Na… (212… http… Centra… ""       New … 1002… Point        
#>  7 American Numismatic S… (212… http… 75 Var… "11th F… New … 1001… Point        
#>  8 Americas Society       (212… http… 680 Pa… ""       New … 1002… Point        
#>  9 Anne Frank Center USA  (212… http… 38 Cro… "5th Fl… New … 1001… Point        
#> 10 Asia Society           (212… http… 725 Pa… ""       New … 1002… Point        
#> # ℹ 120 more rows
#> # ℹ 1 more variable: the_geom.coordinates <list>
nyc_museum_locations(filters = list(city = "New York"))
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
