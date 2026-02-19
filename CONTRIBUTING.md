# Contributing to nycOpenData

Thanks for your interest in contributing to **nycOpenData**! This package provides convenient R wrappers around NYC Open Data (Socrata) API endpoints and returns results as tidy tibbles with optional filtering, sorting, and row limits.

This guide explains how to report issues, propose changes, and submit pull requests.

---

## Code of Conduct

Be respectful and constructive. Assume good intent. Harassment or discrimination of any kind is not tolerated. Please refer to `CODE_OF_CONDUCT.md` for full details.

---

## Ways to Contribute

You can help by:

- Reporting bugs or confusing behavior.
- Suggesting improvements to documentation or examples.
- Adding wrappers for additional NYC Open Data datasets.
- Improving tests and edge-case handling (timeouts, API errors, schema changes).
- Improving performance or developer ergonomics.

---

## Filing Issues

Please open an issue with:

1. **What you expected to happen**
2. **What actually happened**
3. A **minimal reproducible example** (copy/paste-able using the `reprex` package).
4. `sessionInfo()` output.

If the issue is dataset-specific, include:

- The dataset name and/or NYC Open Data dataset ID (e.g., `erm2-nwe9`).
- Any filters used in the function call.
- Whether the issue is intermittent (likely related to rate limits or timeouts).

---

## Development Setup

### 1) Fork and Clone
Fork the repository on GitHub and clone it to your local machine.

### 2) Install Dependencies
Ensure you have the following packages installed for development:

```r
install.packages(c('devtools', 'roxygen2', 'testthat', 'pkgdown', 'vcr', 'webmockr', 'covr'))
```

---

## Development Workflow

### Adding New Datasets
With about 40 scripts currently in the package, we maintain a strict standard for new data-pulling functions. All new wrappers should:

- **Return a `tbl_df` (tibble).**
- **Use `httr::GET`** for API calls to ensure consistency with our error-handling logic.
- **Include standard parameters:** `limit`, `filters`, and `timeout_sec`.
- **Match existing patterns:** Use the standardized column naming conventions provided by the NYC Open Data API.

### Testing with `vcr`
This package uses the `vcr` package to mock API responses, ensuring tests are fast and reliable even without an internet connection.

1. **Write a test** in `tests/testthat/` using a `vcr::use_cassette()` block.
2. **Record the response:** Run the test with an active internet connection to create the initial YAML 'cassette'.
3. **Verify the fixture:** Ensure the `.yml` file is created in `tests/testthat/fixtures/`.
4. **No Secrets:** Ensure you do not record any sensitive API keys or tokens in the cassettes.

### Documentation
We use `roxygen2` for documentation. Before submitting a PR:

1. Run `devtools::document()` to update the NAMESPACE and help files.
2. Run `pkgdown::build_site()` to ensure the documentation website renders correctly.

---

## Submission Process

### The 'Gold Standard' Check
Before submitting a Pull Request, please run the full suite of checks. We only accept PRs that pass with 0 errors and 0 warnings:

```r
devtools::check()
```

### Pull Requests

1. Create a new branch for your feature or fix.
2. Submit the PR against the `main` branch.
3. Link the PR to any relevant issues.
