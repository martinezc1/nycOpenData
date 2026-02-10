# Inmate Incidents - Slashing and Stabbing

Downloads Inmate Incidents - Slashing and Stabbing data from NYC Open
Data.

## Usage

``` r
nyc_slash_stab(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Public-Safety/Inmate-Incidents-Slashing-and-Stabbing/gakf-suji/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Inmate Incidents - Slashing and Stabbing data.

## Details

This dataset contains information about the kind of violent incident
that happens among inmates in prison. There is row that provide the
incidents' ID, the data they were reported, the kind of incident they
were, and in what facilities those incidents occurred.A researcher might
want to use this dataset to investigate the kind of crimes inmates
commit while they are incarcerated.

## Examples

``` r
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_slash_stab(limit = 2)
  small_sample

  # Example with a filter (Change 'column_name' and 'value' to real fields)
  # nyc_slash_stab(limit = 2, filters = list(column_name = "value"))
}
#> # A tibble: 2 × 4
#>   incident_id reported_dt             incident_type facility
#>   <chr>       <chr>                   <chr>         <chr>   
#> 1 227264      2026-01-24T21:10:00.000 Stabbing      GRVC    
#> 2 226926      2026-01-17T19:58:00.000 Stabbing      OBCC    
# }
```
