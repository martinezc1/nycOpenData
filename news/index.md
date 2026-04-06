# Changelog

## nycOpenData 0.2.1

### Major improvements

This release introduces a significant redesign of how datasets are
accessed in nycOpenData, moving from a fixed set of wrapper functions to
a dynamic, catalog-driven approach.

- Introduced
  [`nyc_list_datasets()`](https://martinezc1.github.io/nycOpenData/reference/nyc_list_datasets.md)
  to retrieve the live NYC Open Data catalog.
- Introduced
  [`nyc_pull_dataset()`](https://martinezc1.github.io/nycOpenData/reference/nyc_pull_dataset.md)
  as the primary interface for pulling datasets using either a generated
  key or dataset uid.
- Dataset keys are now generated dynamically using
  [`janitor::make_clean_names()`](https://sfirke.github.io/janitor/reference/make_clean_names.html)
  based on dataset names.
- Users can now access a much broader set of datasets without requiring
  dedicated wrapper functions.

### New features

- Added support for flexible dataset selection using either:
  - human-readable keys (e.g., “311_service_requests”)
  - or stable dataset UIDs (e.g., “erm2-nwe9”)
- Added explicit support for date filtering using `date`, `from`, and
  `to` arguments with user-specified `date_field`.
- Improved filtering capabilities with support for vectorized filters
  (translated to `IN` clauses).

### Documentation

- Updated documentation to reflect the new catalog-driven workflow.
- Clarified differences between dataset keys and UIDs, including
  stability considerations.
- Improved examples demonstrating filtering and date-based queries.
- Internal improvements
- Refactored internal request handling to support dynamic catalog
  lookup.
- Improved validation for inputs such as dataset identifiers and date
  filtering parameters.
- Reduced reliance on individual dataset wrapper functions in favor of a
  unified interface.

### Maintenance

- No breaking changes to existing function signatures, though users are
  encouraged to adopt the new catalog-based workflow.
- Continued improvements to API reliability and internal utilities.
