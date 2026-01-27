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

  nyc_dob_permit_issuance(limit = 2, filters = list(borough = "BROOKLYN"))
}
#> # A tibble: 2 × 50
#>   borough  bin__   house__ street_name job__ job_doc___ job_type self_cert block
#>   <chr>    <chr>   <chr>   <chr>       <chr> <chr>      <chr>    <chr>     <chr>
#> 1 BROOKLYN 3050655 280     LEXINGTON … 3407… 01         A2       Y         01803
#> 2 BROOKLYN 3212495 1657    EAST 37 ST… 3217… 01         A2       N         07710
#> # ℹ 41 more variables: lot <chr>, community_board <chr>, zip_code <chr>,
#> #   bldg_type <chr>, residential <chr>, work_type <chr>, permit_status <chr>,
#> #   filing_status <chr>, permit_type <chr>, permit_sequence__ <chr>,
#> #   permit_subtype <chr>, site_fill <chr>, filing_date <chr>,
#> #   issuance_date <chr>, expiration_date <chr>, job_start_date <chr>,
#> #   permittee_s_first_name <chr>, permittee_s_last_name <chr>,
#> #   permittee_s_business_name <chr>, permittee_s_phone__ <chr>, …
# }
```
