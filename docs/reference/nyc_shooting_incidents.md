# NYPD Shooting Incident Data (Year To Date)

Downloads NYPD Shooting Incident Data (Year to Date) data from NYC Open
Data.

## Usage

``` r
nyc_shooting_incidents(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Year-To-Date-/5ucz-vwe8/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYPD Shooting Incident Data (Year to Date) data.

## Details

This is a data set that will show you every shooting incident that has
occurred in New York City. It will show you the exact occur date, time,
borough in which the shooting took place, location of the incident and
much more. Researchers would use this dataset to find what time of day
does the most shooting incidents take place or which location has the
most shootings.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_shooting_incidents(limit = 2)
  small_sample

  # Example with a filter (replace with real fields/values if desired)
  # nyc_shooting_incidents(limit = 2, filters = list(boro = "BROOKLYN"))
}
```
