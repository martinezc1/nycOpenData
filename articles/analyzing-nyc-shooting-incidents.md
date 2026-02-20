# Getting Started with nycOpenData: data set titled NYPD Shootings Data

``` r
knitr::opts_chunk$set(warning = FALSE, message = FALSE)
library(nycOpenData)
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

## Introduction

If you have lived or live in NYC before, you know how populated it is. A
beautiful city with many things to do. But we unfortunately know that a
very populated city can lead to us hearing about crimes that occur or we
might be curious as to what crime or what type of crime might occur in
our beautiful city. NYC now has data to show you about every shooting
incident that has occurred in NYC. Information that is included is the
date of the incident, the time it occurred, what borough it occurred,
and so much more. If you want to know more information, you can find the
dataset
[here](https://data.cityofnewyork.us/Public-Safety/NYPD-Shootings/98wc-x49t/about_data).
If you want to explore this dataset more, in R, the `nycOpenData`
package can be used to pull this data directly.

By using the
[`nyc_shooting_incidents()`](https://martinezc1.github.io/nycOpenData/reference/nyc_shooting_incidents.md)
function, we can gather the most recent shooting incidents in NYC!

## Pulling a Small Sample

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_shooting_incidents(limit = 3)
small_sample
#> # A tibble: 3 × 13
#>   incident_key occur_date          occur_time boro    loc_of_occur_desc precinct
#>          <dbl> <dttm>              <chr>      <chr>   <chr>                <dbl>
#> 1    318207675 2025-12-31 00:00:00 23:44:00   MANHAT… OUTSIDE                 23
#> 2    318203589 2025-12-31 00:00:00 18:40:00   MANHAT… INSIDE                  32
#> 3    318139227 2025-12-30 00:00:00 03:30:00   BROOKL… INSIDE                  77
#> # ℹ 7 more variables: jurisdiction_code <dbl>, loc_classfctn_desc <chr>,
#> #   location_desc <chr>, x_coord_cd <dbl>, y_coord_cd <dbl>, latitude <dbl>,
#> #   longitude <dbl>

# Seeing what columns are in the data set
names(small_sample)
#>  [1] "incident_key"       "occur_date"         "occur_time"        
#>  [4] "boro"               "loc_of_occur_desc"  "precinct"          
#>  [7] "jurisdiction_code"  "loc_classfctn_desc" "location_desc"     
#> [10] "x_coord_cd"         "y_coord_cd"         "latitude"          
#> [13] "longitude"
```

We have successfully pulled NYPD Shooting Incident Data from the NYC
Open Data Portal.

## Mini analysis

Since we have successfully pulled the data, let’s do a quick analysis to
see the location (name of column: LOC_OF_OCCUR_DESC, Either:Outside or
inside) of shooting incidents in each borough (name of column: BORO).

To do this, we will create a cluster bar graph.

``` r
shooting_data<-nyc_shooting_incidents(limit = 1000)

ggplot(shooting_data, aes(x = boro, fill = loc_of_occur_desc)) +
  geom_bar(position = "dodge") +
  geom_text(
    stat = "count",
    aes(label=after_stat(count)),
    position = position_dodge(width = 0.8),
    vjust=-0.2,
    size = 3) +
  labs(
    title = "Counts For Shooting Incidents",
    x="Borough",
    y="counts of shooting incidents"
  )+
  theme_minimal()
```

![Cluster bar graph showing the number of shooting incidents per borough
with the amount of shootings that took place either outside or
inside](analyzing-nyc-shooting-incidents_files/figure-html/shooting%20incidents%20per%20borough%20location%20typegraph-1.png)

Cluster bar graph showing shooting incidents per borough based on the
location of shooting.

This graph shows us the counts of shooting incidents that took place in
each borough based on the location of the incident (inside or outside)
