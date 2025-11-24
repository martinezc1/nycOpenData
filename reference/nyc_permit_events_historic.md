# NYC Permitted Event Information - Historical

Downloads historical permitted event data from NYC Open Data.

## Usage

``` r
nyc_permit_events_historic(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/bkfu-528j\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing NYC Permitted Event Information - Historical data.

## Details

This dataset includes historical information about events permitted
through the Office of Citywide Event Coordination and Management (CECM),
including parades, festivals, street fairs, and other public gatherings.

## Examples

``` r
if (FALSE) { # \dontrun{
# Fetch a small sample
small_sample <- nyc_permit_events_historic(limit = 10)
head(small_sample)

# Larger pull (will depend on API stability)
nyc_permit_events_historic(limit = 5000)

# With a filter
nyc_permit_events_historic(filters = list(event_type = "Construction"))
} # }
```
