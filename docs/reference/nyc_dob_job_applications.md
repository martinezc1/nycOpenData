# NYC DOB Job Application Filings

Downloads DOB Job Application Filings data from NYC Open Data.

## Usage

``` r
nyc_dob_job_applications(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/ic3t-wcy2\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing DOB Job Application Filings data.

## Details

This dataset includes job application filings submitted to the NYC
Department of Buildings (DOB). Each record represents a construction or
alteration project application, including location, work type, and
approval status.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dob_job_applications(limit = 2)
  small_sample

  nyc_dob_job_applications(limit = 2, filters = list(borough = "BROOKLYN"))
}
#> # A tibble: 2 × 71
#>   job__  doc__ borough house__ street_name block lot   bin__ job_type job_status
#>   <chr>  <chr> <chr>   <chr>   <chr>       <chr> <chr> <chr> <chr>    <chr>     
#> 1 32206… 01    BROOKL… 5224    3RD AVENUE  00805 00049 3332… A1       A         
#> 2 32200… 01    BROOKL… 750     56TH STREET 00842 00027 3015… A2       A         
#> # ℹ 61 more variables: job_status_descrp <chr>, latest_action_date <chr>,
#> #   building_type <chr>, community___board <chr>, cluster <chr>,
#> #   landmarked <chr>, adult_estab <chr>, loft_board <chr>, little_e <chr>,
#> #   efiling_filed <chr>, other <chr>, other_description <chr>,
#> #   applicant_s_first_name <chr>, applicant_s_last_name <chr>,
#> #   applicant_professional_title <chr>, applicant_license__ <chr>,
#> #   professional_cert <chr>, pre__filing_date <chr>, initial_cost <chr>, …
# }
```
