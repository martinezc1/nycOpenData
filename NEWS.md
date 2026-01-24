# nycOpenData 0.1.4

## Bug fixes and maintenance

- Refactored all NYC Open Data API requests to use a shared internal request helper
  with improved timeout handling and graceful failure behavior.
- Ensured all functions that rely on live internet resources fail cleanly with
  informative error messages when the NYC Open Data API is unavailable or slow,
  in accordance with CRAN policies.
- Updated examples to avoid unintended failures during CRAN checks while
  preserving runnable examples for users with internet access.
- No changes to function names, arguments, or returned data structures.
