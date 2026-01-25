# NYC 2015 Street Tree Census - Tree Data

Downloads 2015 Street Tree Census - Tree Data from NYC Open Data.

## Usage

``` r
nyc_tree_census_2015(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/uvpi-gqnh\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing 2015 Street Tree Census - Tree Data.

## Details

This dataset contains records from the 2015 Street Tree Census,
including species, health, and location information for each recorded
tree. Data collected by NYC Parks and volunteers.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_tree_census_2015(limit = 2)
  head(small_sample)

  nyc_tree_census_2015(filters = list(curb_loc = "OnCurb"))
}
#> # A tibble: 10,000 × 45
#>    tree_id block_id created_at        tree_dbh stump_diam curb_loc status health
#>    <chr>   <chr>    <chr>             <chr>    <chr>      <chr>    <chr>  <chr> 
#>  1 722693  999999   2016-10-05T00:00… 3        0          OnCurb   Alive  Good  
#>  2 722688  217025   2016-10-05T00:00… 6        0          OnCurb   Alive  Poor  
#>  3 722690  999999   2016-10-05T00:00… 3        0          OnCurb   Alive  Good  
#>  4 722689  217025   2016-10-05T00:00… 5        0          OnCurb   Alive  Good  
#>  5 722692  999999   2016-10-05T00:00… 2        0          OnCurb   Alive  Good  
#>  6 722691  999999   2016-10-05T00:00… 2        0          OnCurb   Alive  Good  
#>  7 722685  217025   2016-10-05T00:00… 4        0          OnCurb   Alive  Good  
#>  8 722686  217025   2016-10-05T00:00… 18       0          OnCurb   Alive  Good  
#>  9 722687  217025   2016-10-05T00:00… 3        0          OnCurb   Alive  Fair  
#> 10 722694  999999   2016-10-05T00:00… 3        0          OnCurb   Alive  Good  
#> # ℹ 9,990 more rows
#> # ℹ 37 more variables: spc_latin <chr>, spc_common <chr>, steward <chr>,
#> #   guards <chr>, sidewalk <chr>, user_type <chr>, problems <chr>,
#> #   root_stone <chr>, root_grate <chr>, root_other <chr>, trunk_wire <chr>,
#> #   trnk_light <chr>, trnk_other <chr>, brch_light <chr>, brch_shoe <chr>,
#> #   brch_other <chr>, address <chr>, zipcode <chr>, zip_city <chr>,
#> #   cb_num <chr>, borocode <chr>, boroname <chr>, cncldist <chr>, …
# }
```
