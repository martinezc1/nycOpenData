# DOB Permit Issuance

Downloads DOB Permit Issuance data from NYC Open Data.

## Usage

``` r
nyc_dob_permit_issuance(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Housing-Development/DOB-Permit-Issuance/ipu4-2q9a/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

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
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dob_permit_issuance(limit = 2)
  small_sample

  nyc_dob_permit_issuance(filters = list(borough = "BROOKLYN"))
}
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
