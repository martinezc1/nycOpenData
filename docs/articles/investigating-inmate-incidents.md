# Investigating Inmate Incidents

## Introduction

This dataset contains information about the kind of violent incident
that happens among inmates in prison. Each row provides the incident ID,
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

By using the `nyc_slash_stab` function, we can investigate the most
recent violent incidents that occurred among incarcerated individuals to
understand their nature and fatality.

## Let’s take a look at the dataset.

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_slash_stab(limit = 100)
small_sample
#> # A tibble: 100 × 4
#>    incident_id reported_dt             incident_type facility
#>    <chr>       <chr>                   <chr>         <chr>   
#>  1 227264      2026-01-24T21:10:00.000 Stabbing      GRVC    
#>  2 226926      2026-01-17T19:58:00.000 Stabbing      OBCC    
#>  3 226877      2026-01-16T17:51:00.000 Stabbing      NIC     
#>  4 226700      2026-01-13T15:10:00.000 Stabbing      GRVC    
#>  5 226465      2026-01-08T07:09:00.000 Stabbing      RNDC    
#>  6 226408      2026-01-06T23:25:00.000 Stabbing      RMSC    
#>  7 226398      2026-01-06T19:34:00.000 Stabbing      GRVC    
#>  8 226206      2026-01-01T11:14:00.000 Stabbing      OBCC    
#>  9 226110      2025-12-30T13:21:00.000 Stabbing      EMTC    
#> 10 225938      2025-12-26T20:33:00.000 Stabbing      OBCC    
#> # ℹ 90 more rows

# Seeing what columns are in the dataset
colnames(small_sample)
#> [1] "incident_id"   "reported_dt"   "incident_type" "facility"
unique(small_sample$facility)
#> [1] "GRVC" "OBCC" "NIC"  "RNDC" "RMSC" "EMTC" "RESH"
```

The
[`nyc_slash_stab()`](https://martinezc1.github.io/nycOpenData/reference/nyc_slash_stab.md)
function can filter based off any of the columns in the dataset. To
filter, we add `filters = list()` and put whatever filters we would like
inside. From our `colnames` call before, we know that there is a column
called “incident_type” which we can use to accomplish this.

``` r

incident_slash_stab <- nyc_slash_stab(limit = 3, filters = list(incident_type = "Stabbing"))
incident_slash_stab
#> # A tibble: 3 × 3
#>   incident_id reported_dt             incident_type
#>   <chr>       <chr>                   <chr>        
#> 1 76348       2016-02-10T02:49:00.000 Stabbing     
#> 2 78554       2016-04-23T12:54:00.000 Stabbing     
#> 3 79040       2016-05-08T23:18:00.000 Stabbing

# Checking to see the filtering worked
unique(incident_slash_stab$incident_type)
#> [1] "Stabbing"
```

## Note.

The previous sections were riddled with errors in my console! The next
step would be to investigate the “facility” column and potentially run
correlational analysis and plot the results between “incident_type” and
“facility”.

## Further investigation.

This section was meant to look into the most recurring incident types
among inmates and take note of their severity. But for future inquiries:

``` r
# Creating the datasets
slash <- nyc_slash_stab(limit = 50, filters = list(facility = "AMKC", incident_type = "Slashing"))
stab <- nyc_slash_stab(limit = 50, filters = list(facility = "AMKC", incident_type = "Stabbing"))

# Calling head of our new dataset
head(slash)
#> # A tibble: 6 × 4
#>   incident_id reported_dt             incident_type facility
#>   <chr>       <chr>                   <chr>         <chr>   
#> 1 150379      2021-04-30T12:11:00.000 Slashing      AMKC    
#> 2 96849       2017-10-02T04:18:00.000 Slashing      AMKC    
#> 3 97197       2017-10-11T08:27:00.000 Slashing      AMKC    
#> 4 99471       2017-12-08T00:57:00.000 Slashing      AMKC    
#> 5 102244      2018-02-14T01:30:00.000 Slashing      AMKC    
#> 6 103827      2018-03-27T11:34:00.000 Slashing      AMKC
head(stab)
#> # A tibble: 6 × 4
#>   incident_id reported_dt             incident_type facility
#>   <chr>       <chr>                   <chr>         <chr>   
#> 1 98323       2017-11-09T22:45:00.000 Stabbing      AMKC    
#> 2 101638      2018-01-30T09:26:00.000 Stabbing      AMKC    
#> 3 122579      2019-07-16T21:02:00.000 Stabbing      AMKC    
#> 4 122747      2019-07-20T14:17:00.000 Stabbing      AMKC    
#> 5 127101      2019-10-29T20:17:00.000 Stabbing      AMKC    
#> 6 134023      2020-04-06T19:42:00.000 Stabbing      AMKC

# Quick check to make sure our filtering worked
nrow(slash)
#> [1] 50
nrow((stab))
#> [1] 50
unique(slash$facility)
#> [1] "AMKC"
unique(stab$facility)
#> [1] "AMKC"
```

This code should allow us to see how slashing and stabbing incidents
vary by facilities.

## Mini analysis

As an example of how this dataset can be used for exploratory analysis,
the code below groups incidents by facility and incident type, then
visualizes the resulting counts. This approach offers a straightforward
way to compare patterns of violence across locations.

``` r
data <- nyc_slash_stab(limit = 100) %>%
  filter(incident_type %in% c("Slashing", "Stabbing")) %>%
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

If certain codes had worked as intneded in this vignette, one could see
how the package provides a seamless workflow for targeted data
retrieval, automated filtering, and rapid visualization. Importantly,
It’s worth noting that some sections need to be improved as soon as
possible.

## How to Cite

If you use this package for research or educational purposes, please
cite it as follows:

Martinez C (2026). nycOpenData: Convenient Access to NYC Open Data API
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
