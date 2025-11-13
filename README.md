
# nycOpenData <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/NYC_logo.svg/64px-NYC_logo.svg.png" align="right" width="60"/>

`nycOpenData` provides simple, reproducible access to datasets from
the  
[NYC Open Data](https://opendata.cityofnewyork.us/) platform — directly
from R,  
with **no API keys** or manual downloads required.

Version **0.1.2** now includes wrappers for **15+ NYC Open Data APIs**,
covering:

- 311 Service Requests  
- For-Hire Vehicles (FHV)  
- Juvenile Justice (rearrest rates + caseloads)  
- School Discharge Reporting  
- Violent & Disruptive School Incidents  
- Detention Admissions  
- Borough/Community District Reports  
- Street Tree Census  
- Urban Park Ranger Animal Condition Responses  
- Permitted Events (Historical)  
- and more

All functions return clean **tibble** outputs and support filtering
via  
`filters = list(field = "value")`.

------------------------------------------------------------------------

## Installation

### From **CRAN** (once published)

``` r
install.packages("nycOpenData")
```

### Development version (GitHub)

``` r
devtools::install_github("martinezc1/nycOpenData")
```

------------------------------------------------------------------------

## Example

``` r
library(nycOpenData)

# Get 5,000 most recent 311 requests
data <- nyc_311(limit = 5000)

# Filter by agency and city
filtered <- nyc_311(
  limit = 2000,
  filters = list(agency = "NYPD", city = "BROOKLYN")
)

head(filtered)
```

    ## # A tibble: 6 × 35
    ##   unique_key created_date           agency agency_name complaint_type descriptor
    ##   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
    ## 1 66797209   2025-11-12T02:04:55.0… NYPD   New York C… Illegal Parki… Parking P…
    ## 2 66801994   2025-11-12T02:04:00.0… NYPD   New York C… Noise - Resid… Loud Musi…
    ## 3 66801997   2025-11-12T02:02:18.0… NYPD   New York C… Noise - Resid… Loud Talk…
    ## 4 66801875   2025-11-12T02:01:32.0… NYPD   New York C… Blocked Drive… No Access 
    ## 5 66805223   2025-11-12T02:00:04.0… NYPD   New York C… Noise - Resid… Loud Musi…
    ## 6 66803537   2025-11-12T01:59:25.0… NYPD   New York C… Illegal Parki… Blocked H…
    ## # ℹ 29 more variables: location_type <chr>, incident_zip <chr>,
    ## #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
    ## #   cross_street_2 <chr>, intersection_street_1 <chr>,
    ## #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
    ## #   landmark <chr>, status <chr>, community_board <chr>, bbl <chr>,
    ## #   borough <chr>, x_coordinate_state_plane <chr>,
    ## #   y_coordinate_state_plane <chr>, open_data_channel_type <chr>, …

------------------------------------------------------------------------

## About

`nycOpenData` makes New York City’s civic datasets accessible to
students,  
educators, analysts, and researchers through a unified and user-friendly
R interface.  
Developed to support reproducible research, open-data literacy, and
real-world analysis.

------------------------------------------------------------------------

## Author

**Christian A. Martinez**  
<c.martinez0@outlook.com>  
GitHub: <https://github.com/martinezc1>

Developed as part of  
**PSYC 7750G – Reproducible Psychological Research**  
Brooklyn College, City University of New York
