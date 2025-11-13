# nycOpenData 0.1.2

## New Features
- Added a full suite of NYC Open Data API wrapper functions, greatly expanding the package beyond the initial 311 endpoint.
- New API functions include:

### Public Safety
- `nyc_311()`
- `nyc_violent_disruptive_school_incidents()`
- `nyc_dop_juvenile_cases()`
- `nyc_dop_juvenile_rearrest_rate()`

### Housing & Development
- `nyc_DOB_job_applications()`

### Transportation
- `nyc_for_hire_vehicles()`
- `nyc_tlc_new_driver_app_status()`

### City Government / Administration
- `nyc_civil_service_list()`
- `nyc_permit_events_historic()`

### Education
- `nyc_school_discharge()`

### Environment & Wildlife
- `nyc_urban_park_animal_condition()`

## Improvements
- Standardized API query construction across all functions.
- Improved reliability of `$where` filtering through safe-escaping of values.
- Added error handling via `httr::stop_for_status()` to surface API issues clearly.

## Documentation
- Added detailed documentation for all new endpoints, including examples, descriptions, and data sources.
- Expanded package overview to reflect full set of available API wrappers.
