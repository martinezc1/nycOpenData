# DOHMH New York City Restaurant Inspection Results

Downloads DOHMH New York City Restaurant Inspection Results from NYC
Open Data.

## Usage

``` r
nyc_restaurant_inspection_results(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing DOHMH New York City Restaurant Inspection Results
data.

## Details

The dataset contains every sustained or not yet adjudicated violation
citation from every full or special program inspection conducted up to
three years prior to the most recent inspection for restaurants and
college cafeterias in an active status on the RECORD DATE (date of the
data pull). When an inspection results in more than one violation,
values for associated fields are repeated for each additional violation
record. Establishments are uniquely identified by their CAMIS (record
ID) number. Keep in mind that thousands of restaurants start business
and go out of business every year; only restaurants in an active status
are included in the dataset. Records are also included for each
restaurant that has applied for a permit but has not yet been inspected
and for inspections resulting in no violations. Establishments with
inspection date of 1/1/1900 are new establishments that have not yet
received an inspection. Restaurants that received no violations are
represented by a single row and coded as having no violations using the
ACTION field. Because this dataset is compiled from several large
administrative data systems, it contains some illogical values that
could be a result of data entry or transfer errors. Data may also be
missing. This dataset and the information on the Health Department’s
Restaurant Grading website come from the same data source. The Health
Department’s Restaurant Grading website is here:
http://www1.nyc.gov/site/doh/services/restaurant-grades.page See the
data dictionary file in the Attachments section of the OpenData website
for a summary of data fields and allowable values.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_restaurant_inspection_results(limit = 2)
  small_sample

  nyc_restaurant_inspection_results(filters = list(boro = "Queens"))
}
#> # A tibble: 10,000 × 28
#>    camis    dba          boro  building street zipcode phone cuisine_description
#>    <chr>    <chr>        <chr> <chr>    <chr>  <chr>   <chr> <chr>              
#>  1 41630095 DUNKIN       Quee… 102-27   ROOSE… 11368   7184… Donuts             
#>  2 50154932 BUDDHA BAR … Quee… 70-04    ROOSE… 11372   3473… Asian/Asian Fusion 
#>  3 50173958 375 CHICKEN… Quee… 34-60    JUNCT… 11372   3477… Chicken            
#>  4 50046429 CHARO RESTA… Quee… 102-01   37 AV… 11368   7187… Spanish            
#>  5 50178825 NANCY BLAKE… Quee… 82-19    NORTH… 11372   7184… Irish              
#>  6 40864277 GALLAGHER'S… Quee… 43-19    37 ST… 11101   7183… American           
#>  7 50066843 VANESSA'S D… Quee… 30-30    47 AV… 11101   9173… Chinese            
#>  8 50169321 ASADERO LA … Quee… 84-01    NORTH… 11372   3476… Latin American     
#>  9 50114831 HOME OF AST… Quee… 28-49    STEIN… 11103   9177… Fusion             
#> 10 50114831 HOME OF AST… Quee… 28-49    STEIN… 11103   9177… Fusion             
#> # ℹ 9,990 more rows
#> # ℹ 20 more variables: inspection_date <chr>, action <chr>,
#> #   violation_code <chr>, violation_description <chr>, critical_flag <chr>,
#> #   score <chr>, record_date <chr>, inspection_type <chr>, latitude <chr>,
#> #   longitude <chr>, community_board <chr>, council_district <chr>,
#> #   census_tract <chr>, bin <chr>, bbl <chr>, nta <chr>, grade <chr>,
#> #   grade_date <chr>, location.type <chr>, location.coordinates <list>
# }
```
