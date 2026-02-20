# Using Local Law 18 Pay Report Data

## Introduction

Local Law 18 of 2019 (LL18) requires the Department of Citywide
Administrative Services (DCAS) to collect data about the city’s
municipal workforce each year. This information is then made available
to the Office of Data Analytics (ODA) [found
here](https://data.cityofnewyork.us/resource/423i-ukqr.json). In R, the
`nycOpenData` package can be used to pull this data directly.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-reproducible-research-using-r.share.connect.posit.cloud/),
helping students bridge the gap between raw city APIs and tidy data
analysis.

By using the `nyc_locallaw18_payreport` function, we can gather the most
recent statistics from Local Law 18 and filter based upon any of the
columns inside the dataset.

> Note: `nyc_locallaw18_payreport` automatically sorts in descending
> order based on the created_date column.

## Pulling a Small Sample

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_locallaw18_payreport(limit = 3)
small_sample
#> # A tibble: 3 × 11
#>   data_year agency_name         eeo_4_job_category pay_band lower_pay_band_bound
#>       <dbl> <chr>               <chr>              <chr>                   <dbl>
#> 1      2022 TECHNOLOGY & INNOV… TECHNICIANS        95000-9…                95000
#> 2      2022 TECHNOLOGY & INNOV… TECHNICIANS        85000-8…                85000
#> 3      2022 TECHNOLOGY & INNOV… TECHNICIANS        85000-8…                85000
#> # ℹ 6 more variables: upper_pay_band_bound <dbl>, employee_status <chr>,
#> #   race <chr>, ethnicity <chr>, gender <chr>, number_of_employees <chr>

# Seeing what columns are in the dataset
names(small_sample)
#>  [1] "data_year"            "agency_name"          "eeo_4_job_category"  
#>  [4] "pay_band"             "lower_pay_band_bound" "upper_pay_band_bound"
#>  [7] "employee_status"      "race"                 "ethnicity"           
#> [10] "gender"               "number_of_employees"
```

Fantastic! We successfully pulled Local Law 18 Pay Report data from the
NYC Open Data Portal.

Let’s now take an example of the first 3 returned rows with less than 5
employees. The `nyc_locallaw18_payreport` function can filter based on
any of the columns in the dataset. To filter, we add `filters = list()`
and put whatever filters we would like inside. From our `names` call
before, we know that there is a column called “number_of_employees”
which we can use to accomplish this.

``` r

lessthan5_locallaw18payreport <- nyc_locallaw18_payreport(limit = 3, filters = list(number_of_employees = "<5"))
lessthan5_locallaw18payreport 
#> # A tibble: 3 × 11
#>   data_year agency_name         eeo_4_job_category pay_band lower_pay_band_bound
#>       <dbl> <chr>               <chr>              <chr>                   <dbl>
#> 1      2022 TECHNOLOGY & INNOV… TECHNICIANS        95000-9…                95000
#> 2      2022 TECHNOLOGY & INNOV… TECHNICIANS        85000-8…                85000
#> 3      2022 TECHNOLOGY & INNOV… TECHNICIANS        85000-8…                85000
#> # ℹ 6 more variables: upper_pay_band_bound <dbl>, employee_status <chr>,
#> #   race <chr>, ethnicity <chr>, gender <chr>, number_of_employees <chr>


# Checking to see the filtering worked
lessthan5_locallaw18payreport |>
  distinct(number_of_employees)
#> # A tibble: 1 × 1
#>   number_of_employees
#>   <chr>              
#> 1 <5
```

Success! From calling the `nyc_locallaw18_payreport` dataset we see
there are only 3 rows of data, and from the
[`distinct()`](https://dplyr.tidyverse.org/reference/distinct.html) call
we see the only featured “row groups” are those with less than 5
employees.

One of the strongest qualities this function has is its ability to
filter based on of multiple columns. Let’s put everything together and
get a dataset of the last *15* pieces of data from the Local law 18 Pay
Report bracket for “Technology & Innovation” with “less than 5
employees” and “female employees.”

``` r
# Creating the dataset
lessthan5TI_payreport <- nyc_locallaw18_payreport(
  limit = 15,
  filters = list(
    number_of_employees = "<5",
    agency_name = "TECHNOLOGY & INNOVATION",
    gender = "Female"
  )
)

# Calling head of our new dataset
lessthan5TI_payreport |>
  slice_head(n = 6)
#> # A tibble: 6 × 11
#>   data_year agency_name         eeo_4_job_category pay_band lower_pay_band_bound
#>       <dbl> <chr>               <chr>              <chr>                   <dbl>
#> 1      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 35000-3…                35000
#> 2      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 35000-3…                35000
#> 3      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 35000-3…                35000
#> 4      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 35000-3…                35000
#> 5      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 35000-3…                35000
#> 6      2022 TECHNOLOGY & INNOV… ADMINISTRATIVE SU… 40000-4…                40000
#> # ℹ 6 more variables: upper_pay_band_bound <dbl>, employee_status <chr>,
#> #   race <chr>, ethnicity <chr>, gender <chr>, number_of_employees <chr>

# Quick check to make sure our filtering worked
lessthan5TI_payreport |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    15

lessthan5TI_payreport |>
  distinct(agency_name)
#> # A tibble: 1 × 1
#>   agency_name            
#>   <chr>                  
#> 1 TECHNOLOGY & INNOVATION

lessthan5TI_payreport |>
  distinct(gender)
#> # A tibble: 1 × 1
#>   gender
#>   <chr> 
#> 1 Female
```

We successfully created our dataset that contains the 15 most recent
rows for the bracket of “Technology & Innovation” with “less than 5
employees” and “female employees.”

## Mini analysis

Now that we have successfully pulled the data and have it in R, let’s do
a mini analysis, using the `ethnicity` column, to figure out the
ethnicity of those in the aforementioned groups.

To do this, we will create a bar graph of the ethnicities.

``` r

# Visualizing the distribution, ordered by frequency

lessthan5TI_payreport |>
  count(ethnicity) |>          # count how many rows fall in each ethnicity
  ggplot(aes(
    x = n,                       # n = number of rows per ethnicity
    y = reorder(ethnicity, n)    # reorder ethnicities by their counts
  )) +
  geom_col(fill = "steelblue") + # geom_col uses the counts we already computed
  theme_minimal() +
  labs(
    title = "Ethnicity of Female Employees in Bracket of TI Agencies with Fewer Than 5 Employees",
    subtitle = "Most Recent 15 Records",
    x = "Number of Records",
    y = "Ethnicity"
  )
```

![Bar chart showing the ethnicity of female workers in departments with
less than 5 employees in Technology &
Innovation.](Using-Local-Law18-Pay-Report_files/figure-html/compaint-type-graph-1.png)

Bar chart showing the ethnicity of female workers in municipal
departments with less than 5 people in Technology & Innovation (15 most
recent).

This graph shows us not only *how many* rows there are in the bracket of
Technology & Innovation agencies with fewer than 5 employees (female
employees only), but *what* the ethnicities of the workers there are.

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
