# DOB Permit Issuance

Downloads DOB Permit Issuance data from NYC Open Data.

## Usage

``` r
nyc_dob_permit_issuance(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Housing-Development/DOB-Permit-Issuance/ipu4-2q9a/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing DOB Permit Issuance data.

## Details

The Department of Buildings (DOB) issues permits for construction and
demolition activities in the City of New York. The construction industry
must submit an application to DOB with details of the construction job
they would like to complete. The primary types of application, aka job
type, are: New Building, Demolition, and Alterations Type 1, 2, and 3.
Each job type can have multiple work types, such as general
construction, boiler, elevator, and plumbing. Each work type will
receive a separate permit. (See the DOB Job Application Filings dataset
for information about each job application.) Each row/record in this
dataset represents the life cycle of one permit for one work type. The
dataset is updated daily with new records, and each existing record will
be updated as the permit application moves through the approval process
to reflect the latest status of the application.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_dob_permit_issuance(limit = 10)
head(small_sample)
#> # A tibble: 6 × 50
#>   borough    bin__ house__ street_name job__ job_doc___ job_type self_cert block
#>   <chr>      <chr> <chr>   <chr>       <chr> <chr>      <chr>    <chr>     <chr>
#> 1 BRONX      2115… 1072    INTERVALE … 2009… 01         NB       Y         02705
#> 2 STATEN IS… 5106… 280     PARK HILL … 5203… 01         A2       N         02922
#> 3 BRONX      2067… 3913    PROVOST AV… 2206… 01         A2       Y         04973
#> 4 BRONX      2012… 666     EAST 181ST… 2400… 01         A2       Y         03081
#> 5 QUEENS     4616… 148-36  89TH AVENUE 4405… 01         A3       Y         09681
#> 6 STATEN IS… 5019… 292     MOUNTAINVI… 5204… 01         A3       N         00763
#> # ℹ 41 more variables: lot <chr>, community_board <chr>, zip_code <chr>,
#> #   bldg_type <chr>, residential <chr>, permit_status <chr>,
#> #   filing_status <chr>, permit_type <chr>, permit_sequence__ <chr>,
#> #   site_fill <chr>, issuance_date <chr>, expiration_date <chr>,
#> #   job_start_date <chr>, permittee_s_first_name <chr>,
#> #   permittee_s_last_name <chr>, permittee_s_business_name <chr>,
#> #   permittee_s_phone__ <chr>, permittee_s_license_type <chr>, …

# \donttest{
nyc_dob_permit_issuance(limit = 5000)
#> # A tibble: 5,000 × 59
#>    borough   bin__ house__ street_name job__ job_doc___ job_type self_cert block
#>    <chr>     <chr> <chr>   <chr>       <chr> <chr>      <chr>    <chr>     <chr>
#>  1 BRONX     2115… 1072    INTERVALE … 2009… 01         NB       Y         02705
#>  2 STATEN I… 5106… 280     PARK HILL … 5203… 01         A2       N         02922
#>  3 BRONX     2067… 3913    PROVOST AV… 2206… 01         A2       Y         04973
#>  4 BRONX     2012… 666     EAST 181ST… 2400… 01         A2       Y         03081
#>  5 QUEENS    4616… 148-36  89TH AVENUE 4405… 01         A3       Y         09681
#>  6 STATEN I… 5019… 292     MOUNTAINVI… 5204… 01         A3       N         00763
#>  7 MANHATTAN 1083… 100     BEEKMAN ST  1238… 01         A2       N         00094
#>  8 BRONX     2009… 1745    UNIVERSITY… 2206… 01         A2       Y         02878
#>  9 BROOKLYN  3050… 280     LEXINGTON … 3407… 01         A2       Y         01803
#> 10 MANHATTAN 1081… 695     PARK AVENUE 1235… 02         A2       N         01403
#> # ℹ 4,990 more rows
#> # ℹ 50 more variables: lot <chr>, community_board <chr>, zip_code <chr>,
#> #   bldg_type <chr>, residential <chr>, permit_status <chr>,
#> #   filing_status <chr>, permit_type <chr>, permit_sequence__ <chr>,
#> #   site_fill <chr>, issuance_date <chr>, expiration_date <chr>,
#> #   job_start_date <chr>, permittee_s_first_name <chr>,
#> #   permittee_s_last_name <chr>, permittee_s_business_name <chr>, …
nyc_dob_permit_issuance(filters = list(borough = "BROOKLYN"))
#> # A tibble: 10,000 × 60
#>    borough  bin__  house__ street_name job__ job_doc___ job_type self_cert block
#>    <chr>    <chr>  <chr>   <chr>       <chr> <chr>      <chr>    <chr>     <chr>
#>  1 BROOKLYN 30506… 280     LEXINGTON … 3407… 01         A2       Y         01803
#>  2 BROOKLYN 32124… 1657    EAST 37 ST… 3217… 01         A2       N         07710
#>  3 BROOKLYN 30506… 286     LEXINGTON … 3407… 01         A2       Y         01803
#>  4 BROOKLYN 30501… 352     CLIFTON PL… 3407… 01         A2       Y         01794
#>  5 BROOKLYN 31444… 350     67 STREET   3025… 01         A2       Y         05850
#>  6 BROOKLYN 33456… 8973    BAY PARKWAY 3407… 01         A3       Y         06491
#>  7 BROOKLYN 31309… 1845    58TH STREET 3215… 01         A1       N         05494
#>  8 BROOKLYN 30362… 188     ROCHESTER … 3025… 01         A2       Y         01367
#>  9 BROOKLYN 30624… 17      FILLMORE P… 3220… 01         A2       N         02367
#> 10 BROOKLYN 30591… 30      LAFAYETTE … 3406… 01         A2       Y         02111
#> # ℹ 9,990 more rows
#> # ℹ 51 more variables: lot <chr>, community_board <chr>, zip_code <chr>,
#> #   bldg_type <chr>, residential <chr>, work_type <chr>, permit_status <chr>,
#> #   filing_status <chr>, permit_type <chr>, permit_sequence__ <chr>,
#> #   permit_subtype <chr>, site_fill <chr>, filing_date <chr>,
#> #   issuance_date <chr>, expiration_date <chr>, job_start_date <chr>,
#> #   permittee_s_first_name <chr>, permittee_s_last_name <chr>, …
# }
```
