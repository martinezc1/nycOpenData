# Analyzing the Local Law 97 of 2021-Pets in Shelter Report

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

New York City serves a large and diverse population, including
individuals and families who experience housing instability and may rely
on homeless shelters for temporary support. Pets serve many important
role in people’s lives, and understanding pet ownership among shelter
entrants helps inform shelter policy, access to services, and resource
planning.

The **Local Law 97 of 2021 – Pets in Shelter Report** provides quarterly
survey data on the types of pets owned by people entering New York City
homeless shelters.This dataset was recently added to NYC Open Data and
made publicly available on October 14, 2025. These data are published
through NYC Open Data and are available
[here](https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data).

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s open data resources directly in R. By using the
[`nyc_locallaw97_shelter_pets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_locallaw97_shelter_pets.md)
function, we can retrieve the most recent quarterly shelter pet data and
explore trends in pet ownership across time using familiar data analysis
tools.

## Pulling a Small Sample

To start, we’ll pull a small sample of the data to get a sense of what
it looks like. By default, the function retrieves the 10,000 most recent
requests, so we’ll adjust this and only load the latest 3 by using
`limit = 3`.

``` r
small_sample <- nyc_locallaw97_shelter_pets(limit = 3)
small_sample
#> # A tibble: 3 × 24
#>   date_year date_quarter total_applicants had_pet client_borough_of_entry_bronx
#>   <chr>     <chr>        <chr>            <chr>   <chr>                        
#> 1 2026      Qtr 1        12062            16      16                           
#> 2 2025      Qtr 4        12727            10      10                           
#> 3 2025      Qtr 3        11704            10      10                           
#> # ℹ 19 more variables: client_borough_of_entry <chr>,
#> #   client_borough_of_entry_1 <chr>, clients_who_would_have_entered <chr>,
#> #   clients_choosing_to_forego <chr>, chose_to_forego_shelter_for <chr>,
#> #   clients_who_intend_to_regain <chr>, number_of_dogs <chr>,
#> #   number_of_cats <chr>, number_of_birds <chr>, number_of_small_mammals <chr>,
#> #   number_of_reptiles_small <chr>, number_of_fish <chr>,
#> #   did_not_report_pet_type <chr>, pet_s_placed_with_foster <chr>, …

# Seeing what columns are in the dataset
colnames(small_sample)
#>  [1] "date_year"                      "date_quarter"                  
#>  [3] "total_applicants"               "had_pet"                       
#>  [5] "client_borough_of_entry_bronx"  "client_borough_of_entry"       
#>  [7] "client_borough_of_entry_1"      "clients_who_would_have_entered"
#>  [9] "clients_choosing_to_forego"     "chose_to_forego_shelter_for"   
#> [11] "clients_who_intend_to_regain"   "number_of_dogs"                
#> [13] "number_of_cats"                 "number_of_birds"               
#> [15] "number_of_small_mammals"        "number_of_reptiles_small"      
#> [17] "number_of_fish"                 "did_not_report_pet_type"       
#> [19] "pet_s_placed_with_foster"       "pet_s_surrendered_to_animal"   
#> [21] "pet_s_placed_with_family"       "pet_s_placed_with_friend"      
#> [23] "pet_s_placed_with_other"        "pet_s_placed_with_non_profit"
```

Fantastic! We successfully pulled the
`Local Law 97 of 2021-Pets in Shelter Report` data from the NYC Open
Data Portal using the
[`nyc_locallaw97_shelter_pets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_locallaw97_shelter_pets.md)
function.

Let’s now look at an example using the most recent 3 quarters of data.
The
[`nyc_locallaw97_shelter_pets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_locallaw97_shelter_pets.md)
function allows users to filter based on any of the columns in the
dataset. To apply filters, we add `filters = list()` and specify the
desired conditions. From our earlier inspection of the column names, we
know that there are columns such as `date_year` and `date_quarter` that
can be used to filter the data by time period.

``` r

recent_quarters <- nyc_locallaw97_shelter_pets(
  limit = 3,
  filters = list(date_year = 2024))

recent_quarters
#> # A tibble: 3 × 24
#>   date_year date_quarter total_applicants had_pet client_borough_of_entry_bronx
#>   <chr>     <chr>        <chr>            <chr>   <chr>                        
#> 1 2024      Qtr 4        11874            4       4                            
#> 2 2024      Qtr 3        11901            2       2                            
#> 3 2024      Qtr 2        12274            4       4                            
#> # ℹ 19 more variables: client_borough_of_entry <chr>,
#> #   client_borough_of_entry_1 <chr>, clients_who_would_have_entered <chr>,
#> #   clients_choosing_to_forego <chr>, chose_to_forego_shelter_for <chr>,
#> #   clients_who_intend_to_regain <chr>, number_of_dogs <chr>,
#> #   number_of_cats <chr>, number_of_birds <chr>, number_of_small_mammals <chr>,
#> #   number_of_reptiles_small <chr>, number_of_fish <chr>,
#> #   did_not_report_pet_type <chr>, pet_s_placed_with_foster <chr>, …

# Checking to see the filtering worked
unique(recent_quarters$date_year)
#> [1] "2024"
```

Success! From calling the filtered dataset, we see that only three rows
of data are returned, and the
[`unique()`](https://rdrr.io/r/base/unique.html) check confirms that all
observations come from the specified year.

One of the strongest qualities of this function is its ability to filter
based on multiple columns at once. Let’s put everything together and
create a dataset containing all available quarterly records for a
selected year where shelter entrants reported having pets.

``` r
# Creating the dataset
pets_filtered <- nyc_locallaw97_shelter_pets(
  limit = 20,
  filters = list(
    date_year = 2024,
    had_pet = 1))

# Calling head of our new dataset
head(pets_filtered)
#> # A tibble: 0 × 0

# Quick check to make sure our filtering worked
nrow(pets_filtered)
#> [1] 0
unique(pets_filtered$date_year)
#> NULL
unique(pets_filtered$had_pet)
#> NULL
```

We successfully created a dataset containing the most recent quarterly
records for a selected year in which shelter entrants reported having
pets.

## Mini analysis

Now that we’ve successfully pulled the data and have it in R, let’s do a
quick mini analysis to look at how the number of shelter entrants who
reported having pets changes over time.

To do this, we’ll create a simple bar chart showing the number of
applicants with pets in each year.

``` r

pets <- nyc_locallaw97_shelter_pets(limit = 100)
pets$had_pet <- as.numeric(pets$had_pet)

# Summarize by year
pet_by_year <- pets %>%
  group_by(date_year) %>%
  summarize(applicants_with_pets = sum(had_pet, na.rm = TRUE))

# Plot
ggplot(pet_by_year, aes(x = date_year, y = applicants_with_pets)) +
  geom_col(fill = "darkseagreen") +
  theme_minimal() +
  labs(
    title = "Shelter Applicants With Pets by Year (NYC)",
    subtitle = "Local Law 97 - Pets in Shelter Report",
    x = "Year",
    y = "Number of Applicants With Pets"
  )
```

![Bar chart showing the number of shelter applicants with pets by
year.](Analyzing-the-Local-Law-97-of-2021-Pets-in-Shelter-Report_files/figure-html/had-pet-year-graph-1.png)

Bar chart showing the number of shelter applicants with pets by year.

This graph shows how the number of shelter entrants reporting pets
changes across years, which can help highlight broader trends and guide
planning for pet-related shelter resources.

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
