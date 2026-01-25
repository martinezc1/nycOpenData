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
#>  1 40510647 ROTI CORNER… Quee… 18018    HILLS… 11432   7186… Caribbean          
#>  2 41143410 PRESS 195    Quee… 40-11    BELL … 11361   7182… Sandwiches/Salads/…
#>  3 50117709 CHUN YANG T… Quee… 4910     VERNO… 11101   3474… Coffee/Tea         
#>  4 50175203 PRINCE GRIL… Quee… 3801     VERNO… 11101   3479… Sandwiches/Salads/…
#>  5 40370167 BURGER KING  Quee… 222-10   NORTH… 11361   7182… Hamburgers         
#>  6 50142811 IZAYAKA NON… Quee… 46-44    VERNO… 11101   9149… Thai               
#>  7 50087176 K & L DELIC… Quee… 76-01    37 AV… 11372   2015… Sandwiches         
#>  8 50065723 PANTRY MARK… Quee… 2420     JACKS… 11101   7186… Sandwiches/Salads/…
#>  9 50038249 TOUS LES JO… Quee… 39-02    UNION… 11354   7187… Bakery Products/De…
#> 10 50170107 SOL DE COLO… Quee… 3437     BELL … 11361   6315… Latin American     
#> # ℹ 9,990 more rows
#> # ℹ 20 more variables: inspection_date <chr>, action <chr>,
#> #   violation_code <chr>, violation_description <chr>, critical_flag <chr>,
#> #   score <chr>, record_date <chr>, inspection_type <chr>, latitude <chr>,
#> #   longitude <chr>, community_board <chr>, council_district <chr>,
#> #   census_tract <chr>, bin <chr>, bbl <chr>, nta <chr>, grade <chr>,
#> #   grade_date <chr>, location.type <chr>, location.coordinates <list>
# }
```
