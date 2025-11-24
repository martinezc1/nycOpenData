# Changelog

## nycOpenData 0.1.2

CRAN release: 2025-11-17

### New Features

- Added a full suite of NYC Open Data API wrapper functions, greatly
  expanding the package beyond the initial 311 endpoint.
- New API functions include:

#### Public Safety

- [`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
- [`nyc_violent_disruptive_school_incidents()`](https://martinezc1.github.io/nycOpenData/reference/nyc_violent_disruptive_school_incidents.md)
- `nyc_dop_juvenile_cases()`
- [`nyc_dop_juvenile_rearrest_rate()`](https://martinezc1.github.io/nycOpenData/reference/nyc_dop_juvenile_rearrest_rate.md)

#### Housing & Development

- `nyc_DOB_job_applications()`

#### Transportation

- [`nyc_for_hire_vehicles()`](https://martinezc1.github.io/nycOpenData/reference/nyc_for_hire_vehicles.md)
- [`nyc_tlc_new_driver_app_status()`](https://martinezc1.github.io/nycOpenData/reference/nyc_tlc_new_driver_app_status.md)

#### City Government / Administration

- [`nyc_civil_service_list()`](https://martinezc1.github.io/nycOpenData/reference/nyc_civil_service_list.md)
- [`nyc_permit_events_historic()`](https://martinezc1.github.io/nycOpenData/reference/nyc_permit_events_historic.md)

#### Education

- [`nyc_school_discharge()`](https://martinezc1.github.io/nycOpenData/reference/nyc_school_discharge.md)

#### Environment & Wildlife

- [`nyc_urban_park_animal_condition()`](https://martinezc1.github.io/nycOpenData/reference/nyc_urban_park_animal_condition.md)

### Improvements

- Standardized API query construction across all functions.
- Improved reliability of `$where` filtering through safe-escaping of
  values.
- Added error handling via
  [`httr::stop_for_status()`](https://httr.r-lib.org/reference/stop_for_status.html)
  to surface API issues clearly.

### Documentation

- Added detailed documentation for all new endpoints, including
  examples, descriptions, and data sources.
- Expanded package overview to reflect full set of available API
  wrappers.
