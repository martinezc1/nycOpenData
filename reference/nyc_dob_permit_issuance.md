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
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dob_permit_issuance(limit = 2)
  small_sample

  nyc_dob_permit_issuance(limit = 2, filters = list(borough = "BROOKLYN"))
}
```
