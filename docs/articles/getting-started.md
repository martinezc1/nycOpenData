# Getting Started with nycOpenData

``` r
knitr::opts_chunk$set(warning = FALSE, message = FALSE)
library(nycOpenData)
library(ggplot2)
```

## Introduction

NYC has a population of almost 8.5 million people. By calling 311,
residents are able to make comments, inquiries, complaints, and requests
to the city agencies. All 311 service requests are contained in the
dataset, [found
here](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/about_data).
In R, the `nycOpenData` package can be used to pull this data directly.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-textbook--reproducible-research-using-r.share.connect.posit.cloud),
helping students bridge the gap between raw city APIs and tidy data
analysis.

By using the
[`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
function, we can gather the most recent 311 calls in New York City, and
filter based upon any of the columns inside the dataset.

> Note:
> [`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
> automatically sorts in descending order based on the created_date
> column.

## Pulling a Small Sample

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_shooting_incidents(limit = 3)
small_sample
#> # A tibble: 3 × 22
#>   incident_key occur_date            occur_time boro  loc_of_occur_desc precinct
#>   <chr>        <chr>                 <chr>      <chr> <chr>             <chr>   
#> 1 313716449    2025-09-30T00:00:00.… 17:56:00   BRONX OUTSIDE           48      
#> 2 313716449    2025-09-30T00:00:00.… 17:56:00   BRONX OUTSIDE           48      
#> 3 313635117    2025-09-29T00:00:00.… 04:17:00   QUEE… OUTSIDE           102     
#> # ℹ 16 more variables: jurisdiction_code <chr>, loc_classfctn_desc <chr>,
#> #   location_desc <chr>, statistical_murder_flag <chr>, perp_age_group <chr>,
#> #   perp_sex <chr>, perp_race <chr>, vic_age_group <chr>, vic_sex <chr>,
#> #   vic_race <chr>, x_coord_cd <chr>, y_coord_cd <chr>, latitude <chr>,
#> #   longitude <chr>, geocoded_column.type <chr>,
#> #   geocoded_column.coordinates <list>

# Seeing what columns are in the dataset
colnames(small_sample)
#>  [1] "incident_key"                "occur_date"                 
#>  [3] "occur_time"                  "boro"                       
#>  [5] "loc_of_occur_desc"           "precinct"                   
#>  [7] "jurisdiction_code"           "loc_classfctn_desc"         
#>  [9] "location_desc"               "statistical_murder_flag"    
#> [11] "perp_age_group"              "perp_sex"                   
#> [13] "perp_race"                   "vic_age_group"              
#> [15] "vic_sex"                     "vic_race"                   
#> [17] "x_coord_cd"                  "y_coord_cd"                 
#> [19] "latitude"                    "longitude"                  
#> [21] "geocoded_column.type"        "geocoded_column.coordinates"
```

Fantastic! We successfully pulled 311 data from the NYC Open Data
Portal.

Let’s now take an example of the last 3 requests from the borough
Brooklyn. The
[`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
function can filter based off any of the columns in the dataset. To
filter, we add `filters = list()` and put whatever filters we would like
inside. From our `colnames` call before, we know that there is a column
called “borough” which we can use to accomplish this.

``` r

brooklyn_311 <- nyc_311(limit = 3, filters = list(borough = "BROOKLYN"))
brooklyn_311
#> # A tibble: 3 × 32
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67892247   2026-02-08T02:02:31.0… NYPD   New York C… Noise - Comme… Loud Musi…
#> 2 67888131   2026-02-08T02:02:07.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 3 67892256   2026-02-08T02:01:12.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> # ℹ 26 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

# Checking to see the filtering worked
unique(brooklyn_311$borough)
#> [1] "BROOKLYN"
```

Success! From calling the `brooklyn_311` dataset we see there are only 3
rows of data, and from the
[`unique()`](https://rdrr.io/r/base/unique.html) call we see the only
borough featured in our dataset is BROOKLYN.

One of the strongest qualities this function has is its ability to
filter based off of multiple columns. Let’s put everything together and
get a dataset of the last *50* 311 requests from the New York Police
Department in Brooklyn.

``` r
# Creating the dataset
brooklyn_nypd <- nyc_311(limit = 50, filters = list(agency = "NYPD", borough = "BROOKLYN"))

# Calling head of our new dataset
head(brooklyn_nypd)
#> # A tibble: 6 × 38
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67892247   2026-02-08T02:02:31.0… NYPD   New York C… Noise - Comme… Loud Musi…
#> 2 67888131   2026-02-08T02:02:07.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 3 67892256   2026-02-08T02:01:12.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 4 67883841   2026-02-08T02:00:14.0… NYPD   New York C… Blocked Drive… No Access 
#> 5 67889527   2026-02-08T01:57:07.0… NYPD   New York C… Noise - Resid… Loud Tele…
#> 6 67885316   2026-02-08T01:56:13.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> # ℹ 32 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

# Quick check to make sure our filtering worked
nrow(brooklyn_nypd)
#> [1] 50
unique(brooklyn_nypd$agency)
#> [1] "NYPD"
unique(brooklyn_nypd$borough)
#> [1] "BROOKLYN"
```

We successfully created our dataset that contains the 50 most recent
requests regarding the NYPD in the borough Brooklyn.

## Mini analysis

Now that we have successfully pulled the data and have it in R, let’s do
a mini analysis on using the `complaint_type` column, to figure out what
NYC residents in Brooklyn are complaining about to the NYPD.

To do this, we will create a bar graph of the complaint types.

``` r
# Visualizing the distribution, ordered by frequency
ggplot(brooklyn_nypd, aes(y = reorder(complaint_type, complaint_type, length))) +
  geom_bar(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Most Recent NYPD 311 Complaints (Brooklyn)",
    subtitle = "Top 50 service requests",
    x = "Number of Complaints",
    y = "Type of Complaint"
  )
```

![Bar chart showing the frequency of NYPD-related 311 complaint types in
Brooklyn from the 50 most recent service
requests.](getting-started_files/figure-html/compaint-type-graph-1.png)

Bar chart showing the frequency of NYPD-related 311 complaint types in
Brooklyn from the 50 most recent service requests.

This graph shows us not only *which* complaints were made, but *how
many* of each complaint were made.

## Summary

The `nycOpenData` package serves as a robust interface for the NYC Open
Data portal, streamlining the path from raw city APIs to actionable
insights. By abstracting the complexities of data acquisition—such as
pagination, type-casting, and complex filtering—it allows users to focus
on analysis rather than data engineering.

As demonstrated in this vignette, the package provides a seamless
workflow for targeted data retrieval, automated filtering, and rapid
visualization.

## How to Cite

If you use this package for research or educational purposes, please
cite it as follows:

Martinez C (2026). nycOpenData: Convenient Access to NYC Open Data API
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
