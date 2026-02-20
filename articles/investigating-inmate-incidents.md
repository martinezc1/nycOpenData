# Investigating Inmate Incidents

## Introduction

This dataset contains information regarding the [Inmate Incidents -
Slashing and
Stabbing](https://data.cityofnewyork.us/Public-Safety/Inmate-Incidents-Slashing-and-Stabbing/gakf-suji/about_data)
dataset on the NYC Open Data portal. Each row provides the incident ID,
the date the incident was reported, the incident type, and the facility
where it occurred. A researcher might want to use this dataset to
investigate the kind of crimes inmates commit while they are
incarcerated.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-reproducible-research-using-r.share.connect.posit.cloud/),
helping students bridge the gap between raw city APIs and tidy data
analysis.

By using the
[`nyc_slash_stab()`](https://martinezc1.github.io/nycOpenData/reference/nyc_slash_stab.md)
function, we can investigate the most recent violent incidents that
occurred among incarcerated individuals to understand their nature and
fatality.

## Let’s take a look at the dataset.

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_slash_stab(limit = 3)
small_sample
#> # A tibble: 3 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1      227264 2026-01-24 21:10:00 Stabbing      GRVC    
#> 2      226926 2026-01-17 19:58:00 Stabbing      OBCC    
#> 3      226877 2026-01-16 17:51:00 Stabbing      NIC

# Seeing what columns are in the dataset
names(small_sample)
#> [1] "incident_id"   "reported_dt"   "incident_type" "facility"

small_sample |>
  distinct(facility)
#> # A tibble: 3 × 1
#>   facility
#>   <chr>   
#> 1 GRVC    
#> 2 OBCC    
#> 3 NIC
```

The
[`nyc_slash_stab()`](https://martinezc1.github.io/nycOpenData/reference/nyc_slash_stab.md)
function can filter based on any of the columns in the dataset. To
filter, we add `filters = list()` and put whatever filters we would like
inside. From our [`names()`](https://rdrr.io/r/base/names.html) call
before, we know that there is a column called “incident_type” which we
can use to accomplish this.

``` r

incident_slash_stab <- nyc_slash_stab(limit = 3, filters = list(incident_type = "Stabbing"))
incident_slash_stab
#> # A tibble: 3 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1      227264 2026-01-24 21:10:00 Stabbing      GRVC    
#> 2      226926 2026-01-17 19:58:00 Stabbing      OBCC    
#> 3      226877 2026-01-16 17:51:00 Stabbing      NIC

# Checking to see the filtering worked
incident_slash_stab |>
  distinct(incident_type)
#> # A tibble: 1 × 1
#>   incident_type
#>   <chr>        
#> 1 Stabbing
```

## Further investigation.

This section was meant to look into the most recurring incident types
among inmates and take note of their severity. But for future inquiries:

``` r
# Creating the datasets
slash <- nyc_slash_stab(limit = 50, filters = list(facility = "AMKC", incident_type = "Slashing"))

stab <- nyc_slash_stab(limit = 50, filters = list(facility = "AMKC", incident_type = "Stabbing"))

# Calling head of our new dataset
slash |>
  slice_head(n = 6)
#> # A tibble: 6 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1       96849 2017-10-02 04:18:00 Slashing      AMKC    
#> 2       97197 2017-10-11 08:27:00 Slashing      AMKC    
#> 3       99471 2017-12-08 00:57:00 Slashing      AMKC    
#> 4      102244 2018-02-14 01:30:00 Slashing      AMKC    
#> 5      103827 2018-03-27 11:34:00 Slashing      AMKC    
#> 6      104489 2018-04-16 00:10:00 Slashing      AMKC

stab |>
  slice_head(n = 6)
#> # A tibble: 6 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1      101638 2018-01-30 09:26:00 Stabbing      AMKC    
#> 2      122579 2019-07-16 21:02:00 Stabbing      AMKC    
#> 3      122747 2019-07-20 14:17:00 Stabbing      AMKC    
#> 4      127101 2019-10-29 20:17:00 Stabbing      AMKC    
#> 5      134023 2020-04-06 19:42:00 Stabbing      AMKC    
#> 6      129702 2019-12-27 14:17:00 Stabbing      AMKC

# Quick check to make sure our filtering worked
slash |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50

stab |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50

slash |>
  distinct(facility)
#> # A tibble: 1 × 1
#>   facility
#>   <chr>   
#> 1 AMKC

stab |>
  distinct(facility)
#> # A tibble: 1 × 1
#>   facility
#>   <chr>   
#> 1 AMKC
```

This code should allow us to see how slashing and stabbing incidents
vary by facilities.

## Mini analysis

As an example of how this dataset can be used for exploratory analysis,
the code below groups incidents by facility and incident type, then
visualizes the resulting counts. This approach offers a straightforward
way to compare patterns of violence across locations.

``` r
data <- nyc_slash_stab(limit = 100) |>
  filter(incident_type %in% c("Slashing", "Stabbing")) |>
  count(facility, incident_type, name = "count")

ggplot(data, aes(x = incident_type, y = count, fill = facility)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(
    title = "Slashing vs Stabbing Incidents by Facility",
    x = "Incident Type",
    y = "Number of Incidents",
    fill = "Facility"
  )
```

![This figure shows incident types by
facility.](investigating-inmate-incidents_files/figure-html/unnamed-chunk-2-1.png)

This figure shows incident types by facility.

## Summary

The `nycOpenData` package serves as a robust interface for the NYC Open
Data portal, streamlining the path from raw city APIs to actionable
insights. By abstracting the complexities of data acquisition—such as
pagination, type-casting, and complex filtering—it allows users to focus
on analysis rather than data engineering.

## How to Cite

If you use this package for research or educational purposes, please
cite it as follows:

Martinez C (2026). nycOpenData: Convenient Access to NYC Open Data API
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
