# DOHMH New York City Restaurant Inspection Results

Downloads DOHMH New York City Restaurant Inspection Results from NYC
Open Data.

## Usage

``` r
nyc_restaurant_inspection_results(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

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
# Quick example (fetch 10 rows)
small_sample <- nyc_restaurant_inspection_results(limit = 10)
head(small_sample)
#> # A tibble: 6 × 28
#>   camis    dba           boro  building street zipcode phone cuisine_description
#>   <chr>    <chr>         <chr> <chr>    <chr>  <chr>   <chr> <chr>              
#> 1 50170017 U&M CAFE BAK… Manh… 303      GRAND… 10002   5166… Chinese            
#> 2 50068508 KUNG FU TEA   Quee… 82-02    ROOSE… 11372   9174… Coffee/Tea         
#> 3 50077169 SERENDIPITY 3 Manh… 225      EAST … 10022   2128… American           
#> 4 50178009 MALA TOWN     Manh… 162      EAST … 10010   6608… Chinese            
#> 5 50163454 TILIA LA CAS… Bronx 3648     BAILE… 10463   9292… Spanish            
#> 6 50177364 GUAC TIME     Bronx 205      EAST … 10458   9174… Mexican            
#> # ℹ 20 more variables: inspection_date <chr>, action <chr>,
#> #   violation_code <chr>, violation_description <chr>, critical_flag <chr>,
#> #   score <chr>, grade <chr>, record_date <chr>, inspection_type <chr>,
#> #   latitude <chr>, longitude <chr>, community_board <chr>,
#> #   council_district <chr>, census_tract <chr>, bin <chr>, bbl <chr>,
#> #   nta <chr>, grade_date <chr>, location.type <chr>,
#> #   location.coordinates <list>

# \donttest{
nyc_restaurant_inspection_results(limit = 5000)
#> # A tibble: 5,000 × 28
#>    camis    dba          boro  building street zipcode phone cuisine_description
#>    <chr>    <chr>        <chr> <chr>    <chr>  <chr>   <chr> <chr>              
#>  1 50170017 U&M CAFE BA… Manh… 303      GRAND… 10002   5166… Chinese            
#>  2 50068508 KUNG FU TEA  Quee… 82-02    ROOSE… 11372   9174… Coffee/Tea         
#>  3 50077169 SERENDIPITY… Manh… 225      EAST … 10022   2128… American           
#>  4 50178009 MALA TOWN    Manh… 162      EAST … 10010   6608… Chinese            
#>  5 50163454 TILIA LA CA… Bronx 3648     BAILE… 10463   9292… Spanish            
#>  6 50177364 GUAC TIME    Bronx 205      EAST … 10458   9174… Mexican            
#>  7 50134501 WENDY'S      Manh… 24       WEST … 10010   5169… American           
#>  8 50039250 LIN'S GARDEN Bronx 3986     WHITE… 10466   7185… Chinese            
#>  9 50175950 POKE BURRIT… Broo… 265      METRO… 11211   9177… Japanese           
#> 10 40700664 PHO BANG     Manh… 157      MOTT … 10013   2129… Southeast Asian    
#> # ℹ 4,990 more rows
#> # ℹ 20 more variables: inspection_date <chr>, action <chr>,
#> #   violation_code <chr>, violation_description <chr>, critical_flag <chr>,
#> #   score <chr>, grade <chr>, record_date <chr>, inspection_type <chr>,
#> #   latitude <chr>, longitude <chr>, community_board <chr>,
#> #   council_district <chr>, census_tract <chr>, bin <chr>, bbl <chr>,
#> #   nta <chr>, grade_date <chr>, location.type <chr>, …
nyc_restaurant_inspection_results(filters = list(boro = "Queens"))
#> # A tibble: 10,000 × 28
#>    camis    dba          boro  building street zipcode phone cuisine_description
#>    <chr>    <chr>        <chr> <chr>    <chr>  <chr>   <chr> <chr>              
#>  1 50068508 KUNG FU TEA  Quee… 82-02    ROOSE… 11372   9174… Coffee/Tea         
#>  2 50084337 AREPA LADY   Quee… 77-17    37 AV… 11372   9177… Latin American     
#>  3 50084337 AREPA LADY   Quee… 77-17    37 AV… 11372   9177… Latin American     
#>  4 41254984 CAFE SALAMA… Quee… 79-05    NORTH… 11372   7184… Spanish            
#>  5 50165093 ZAO DIAN JI… Quee… 59-14    MAIN … 11355   9292… Chinese            
#>  6 41391483 TIGER SUGAR  Quee… 135-45   ROOSE… 11354   7185… Coffee/Tea         
#>  7 50009411 DELICIAS CA… Quee… 94-18    SUTPH… 11435   7182… Spanish            
#>  8 40880194 TOURNESOL    Quee… 50-12    VERNO… 11101   7184… French             
#>  9 50174517 ROSA'S PIZZA Quee… 55-26    69 ST… 11378   7184… Pizza              
#> 10 50009411 DELICIAS CA… Quee… 94-18    SUTPH… 11435   7182… Spanish            
#> # ℹ 9,990 more rows
#> # ℹ 20 more variables: inspection_date <chr>, action <chr>,
#> #   violation_code <chr>, violation_description <chr>, critical_flag <chr>,
#> #   score <chr>, grade <chr>, grade_date <chr>, record_date <chr>,
#> #   inspection_type <chr>, latitude <chr>, longitude <chr>,
#> #   community_board <chr>, council_district <chr>, census_tract <chr>,
#> #   bin <chr>, bbl <chr>, nta <chr>, location.type <chr>, …
# }
```
