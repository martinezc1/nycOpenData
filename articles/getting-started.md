# Getting Started with nycOpenData

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

Welcome to the `nycOpenData` package, a R package dedicated to helping R
users connect to the [NYC Open Data
Portal](https://opendata.cityofnewyork.us/)!

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal, helping users bridge the gap between raw city APIs
and tidy data analysis. It does this in two ways:

### The `nyc_pull_dataset()` function

The primary way to pull data in this package is the
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
function, which works in tandem with
[`nyc_list_datasets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_list_datasets.md).
You do not need to know anything about API keys or authentication.

The first step would be to call the
[`nyc_list_datasets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_list_datasets.md)
to see what datasets are in the list and available to use in the
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
function. The provides information for thousands of datasets found on
the portal.

``` r
nyc_list_datasets() |> head()
#> # A tibble: 6 × 26
#>   key              uid   name  datasetinformation_a…¹ description type  category
#>   <chr>            <chr> <chr> <chr>                  <chr>       <chr> <chr>   
#> 1 orr_points       dhcf… ORR_… Mayor's Office of Cli… Completed,… data… City Go…
#> 2 off_year_and_sp… ups9… Off-… Campaign Finance Boar… This datas… data… City Go…
#> 3 parks_trails     vjbm… Park… Department of Parks a… Location o… data… Environ…
#> 4 where_the_dolla… qhm5… Wher… Mayor's Office of Man… This datas… data… City Go…
#> 5 citywide_mobili… rb38… City… Department of Transpo… In 2020, N… data… Transpo…
#> 6 x2013_2014_scho… ac4n… 2013… Department of Educati… School Loc… data… Educati…
#> # ℹ abbreviated name: ¹​datasetinformation_agency
#> # ℹ 19 more variables: legislativecompliance_datasetfromtheopendataplan <chr>,
#> #   url <chr>, update_datemadepublic <chr>, update_updatefrequency <chr>,
#> #   last_data_updated_date <chr>,
#> #   legislativecompliance_candatasetfeasiblybeautomated <chr>,
#> #   update_automation <chr>, legislativecompliance_hasdatadictionary <chr>,
#> #   legislativecompliance_containsaddress <chr>, …
```

The output includes columns such as the dataset title, description, and
link to the source. The most important pieces are the key **and** uid.
You need **either** in order to use the
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
function. You can put **either** the key value or uid value into the
`dataset =` filter inside of
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md).

For instance, if we want to pull the the dataset
`Motor Vehicle Collisions - Crashes`, we can use either of the methods
below:

``` r
nyc_motor_vehicle_collisions_data <- nyc_pull_dataset(
  dataset = "h9gi-nx95", limit = 2)

nyc_motor_vehicle_collisions_data <- nyc_pull_dataset(
  dataset = "motor_vehicle_collisions_crashes", limit = 2)
```

No matter if we put the `uid` or the `key` as the value for `dataset =`,
we successfully get the data!

### The `nyc_any_dataset()` function

The easiest workflow is to use
[`nyc_list_datasets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_list_datasets.md)
together with
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md).
However, there are ample datasets on the portal, with new ones being
added all the time, and so the list does not have all of the datasets.

In the event that you have a particular dataset you want to use in R
that is not in the list, you can use the
[`nyc_any_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_any_dataset.md).
The only requirement is the dataset’s API endpoint (a URL provided by
the NYC Open Data portal). Here are the steps to get it:

1.  On the NYC Open Data Portal, go to the dataset you want to work
    with.
2.  Click on “Export” (next to the actions button on the right hand
    side).
3.  Click on “API Endpoint”.
4.  Click on “SODA2” for “Version”.
5.  Copy the API Endpoint.

Below is an example of how to use the
[`nyc_any_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_any_dataset.md)
once the API endpoint has been discovered, that will pull the same data
as the
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
example:

``` text
nyc_motor_vehicle_collisions_data <- nyc_any_dataset(json_link = "https://data.cityofnewyork.us/resource/h9gi-nx95.json", limit = 2)
```

### Rule of Thumb

While both functions provide access to NYC Open Data, they serve
slightly different purposes.

In general:

- Use
  [`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
  when the dataset is available in
  [`nyc_list_datasets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_list_datasets.md)
- Use
  [`nyc_any_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_any_dataset.md)
  when working with datasets outside the catalog

Together, these functions allow users to either quickly access the
datasets or flexibly query any dataset available on the NYC Open Data
portal.

## Real World Example

NYC has a population of almost 8.5 million people, and while there are a
lot of people taking public transportation, there are still many
drivers. Unfortunately, there are sometimes crashes that take place, and
all collision data are contained in the dataset, [found
here](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data).
In R, the `nycOpenData` package can be used to pull this data directly.

By using the
[`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
function, we can gather the most recent 311 calls in New York City, and
filter based upon any of the columns inside the dataset.

Let’s take an example of the last 3 requests from the borough Brooklyn.
The `nyc_311()` function can filter based off any of the columns in the
dataset. To filter, we add `filters = list()` and put whatever filters
we would like inside. From our `colnames` call before, we know that
there is a column called “borough” which we can use to accomplish this.

``` r

brooklyn_collisions <- nyc_pull_dataset(dataset = "h9gi-nx95",limit = 2, timeout_sec = 90, filters = list(borough = "BROOKLYN"))
brooklyn_collisions
#> # A tibble: 2 × 27
#>   crash_date          crash_time borough  zip_code latitude longitude
#>   <dttm>              <chr>      <chr>       <dbl>    <dbl>     <dbl>
#> 1 2023-11-01 00:00:00 1:29       BROOKLYN    11230     40.6     -74.0
#> 2 2021-09-11 00:00:00 9:35       BROOKLYN    11208     40.7     -73.9
#> # ℹ 21 more variables: on_street_name <chr>, off_street_name <chr>,
#> #   number_of_persons_injured <dbl>, number_of_persons_killed <dbl>,
#> #   number_of_pedestrians_injured <dbl>, number_of_pedestrians_killed <dbl>,
#> #   number_of_cyclist_injured <dbl>, number_of_cyclist_killed <dbl>,
#> #   number_of_motorist_injured <dbl>, number_of_motorist_killed <dbl>,
#> #   contributing_factor_vehicle_1 <chr>, contributing_factor_vehicle_2 <chr>,
#> #   contributing_factor_vehicle_3 <chr>, collision_id <dbl>, …

# Checking to see the filtering worked
brooklyn_collisions |>
  distinct(borough)
#> # A tibble: 1 × 1
#>   borough 
#>   <chr>   
#> 1 BROOKLYN
```

Success! From calling the `brooklyn_collisions` dataset we see there are
only 2 rows of data, and from the
[`distinct()`](https://dplyr.tidyverse.org/reference/distinct.html) call
we see the only borough featured in our dataset is BROOKLYN.

One of the strongest qualities this function has is its ability to
filter based off of multiple columns. Let’s put everything together and
get a dataset of the last *50* collisions in Brooklyn involving a Sedan.

``` r
# Creating the dataset
brooklyn_sedan <- nyc_pull_dataset("h9gi-nx95", limit = 50, timeout_sec = 90, filters = list(vehicle_type_code1 = "Sedan", borough = "BROOKLYN"))

# Calling head of our new dataset
brooklyn_sedan |>
  slice_head(n = 6)
#> # A tibble: 6 × 29
#>   crash_date          crash_time borough  zip_code latitude longitude
#>   <dttm>              <chr>      <chr>       <dbl>    <dbl>     <dbl>
#> 1 2021-09-11 00:00:00 9:35       BROOKLYN    11208     40.7     -73.9
#> 2 2021-12-14 00:00:00 21:10      BROOKLYN    11207     40.7     -73.9
#> 3 2021-12-14 00:00:00 20:03      BROOKLYN    11226     40.7     -74.0
#> 4 2021-12-14 00:00:00 17:31      BROOKLYN    11230     40.6     -74.0
#> 5 2021-12-14 00:00:00 20:13      BROOKLYN    11215     40.7     -74.0
#> 6 2021-12-14 00:00:00 12:54      BROOKLYN    11217     40.7     -74.0
#> # ℹ 23 more variables: cross_street_name <chr>,
#> #   number_of_persons_injured <dbl>, number_of_persons_killed <dbl>,
#> #   number_of_pedestrians_injured <dbl>, number_of_pedestrians_killed <dbl>,
#> #   number_of_cyclist_injured <dbl>, number_of_cyclist_killed <dbl>,
#> #   number_of_motorist_injured <dbl>, number_of_motorist_killed <dbl>,
#> #   contributing_factor_vehicle_1 <chr>, collision_id <dbl>,
#> #   vehicle_type_code1 <chr>, contributing_factor_vehicle_2 <chr>, …

# Quick check to make sure our filtering worked
brooklyn_sedan |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50

brooklyn_sedan |>
  distinct(vehicle_type_code1)
#> # A tibble: 1 × 1
#>   vehicle_type_code1
#>   <chr>             
#> 1 Sedan

brooklyn_sedan |>
  distinct(borough)
#> # A tibble: 1 × 1
#>   borough 
#>   <chr>   
#> 1 BROOKLYN
```

We successfully created our dataset that contains the 50 requests
regarding a Sedan in the borough Brooklyn.

### Mini analysis

Now that we have successfully pulled the data and have it in R, let’s do
a mini analysis on using the `contributing_factor_vehicle_1` column, to
figure out what are the main reasons for the collisions.

To do this, we will create a bar graph of the complaint types.

``` r
# Visualizing the distribution, ordered by frequency
brooklyn_sedan |>
  count(contributing_factor_vehicle_1) |>
  ggplot(aes(
    x = n,
    y = reorder(contributing_factor_vehicle_1, n)
  )) +
  geom_col(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Top 50 Collisions in Brooklyn Involving a Sedan",
    x = "Number of Collisions",
    y = "Contributing Factor"
  )
```

![Bar chart showing the frequency of collision contributing factors in
Brooklyn involving a
Sedan.](getting-started_files/figure-html/compaint-type-graph-1.png)

ar chart showing the frequency of collision contributing factors in
Brooklyn involving a Sedan.

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
Endpoints. R package version 0.2.0,
<https://martinezc1.github.io/nycOpenData/>.
