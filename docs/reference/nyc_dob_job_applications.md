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
  # Quick example (fetch 10 rows)
  small_sample <- nyc_dob_job_applications(limit = 10)
  head(small_sample)

  nyc_dob_job_applications(limit = 5000)
}
#> # A tibble: 5,000 × 96
#>    job__ doc__ borough house__ street_name block lot   bin__ job_type job_status
#>    <chr> <chr> <chr>   <chr>   <chr>       <chr> <chr> <chr> <chr>    <chr>     
#>  1 1230… 01    MANHAT… 408     WEST 25 ST… 00722 00046 1012… A2       A         
#>  2 3220… 01    BROOKL… 5224    3RD AVENUE  00805 00049 3332… A1       A         
#>  3 5203… 01    STATEN… 20      BUTTONWOOD… 00880 00007 5174… A2       A         
#>  4 5203… 01    STATEN… 162     YETMAN AVE… 08025 00088 5174… A2       A         
#>  5 3220… 01    BROOKL… 750     56TH STREET 00842 00027 3015… A2       A         
#>  6 4219… 01    QUEENS  130-11  127TH. STR… 11765 00029 4255… DM       A         
#>  7 5203… 01    STATEN… 402     WILLOW ROA… 01494 00122 5112… A2       A         
#>  8 1237… 01    MANHAT… 17      BATTERY PL… 00015 07501 1082… A2       A         
#>  9 3001… 05    BROOKL… 1852    58 STREET   05505 00028 3131… A1       P         
#> 10 4217… 04    QUEENS  190     BEACH 69 S… 15939 00103 4614… A2       P         
#> # ℹ 4,990 more rows
#> # ℹ 86 more variables: job_status_descrp <chr>, latest_action_date <chr>,
#> #   building_type <chr>, community___board <chr>, cluster <chr>,
#> #   landmarked <chr>, adult_estab <chr>, loft_board <chr>, little_e <chr>,
#> #   efiling_filed <chr>, other <chr>, other_description <chr>,
#> #   applicant_s_first_name <chr>, applicant_s_last_name <chr>,
#> #   applicant_professional_title <chr>, applicant_license__ <chr>, …
# }
```
