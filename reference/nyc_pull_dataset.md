# Pull a NYC Open Data dataset from the nycOpenData catalog

Uses a dataset \`key\` (from \`nyc_list_datasets()\`) to pull data from
NYC Open Data with sensible defaults (dataset id, default ordering,
optional default date field).

## Usage

``` r
nyc_pull_dataset(
  key,
  limit = 10000,
  filters = list(),
  date = NULL,
  from = NULL,
  to = NULL,
  where = NULL,
  order = NULL,
  timeout_sec = 30,
  clean_names = TRUE,
  coerce_types = TRUE
)
```

## Arguments

- key:

  A dataset key from \`nyc_list_datasets()\` (e.g.,
  "nyc_311_2010_2019").

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional named list of filters. Supports vectors (translated to IN()).

- date:

  Optional single date (matches all times that day) using the catalog
  \`default_date_field\`.

- from:

  Optional start date (inclusive) using the catalog
  \`default_date_field\`.

- to:

  Optional end date (exclusive) using the catalog
  \`default_date_field\`.

- where:

  Optional raw SoQL WHERE clause. If date/from/to are provided, they are
  AND-ed with this.

- order:

  Optional SoQL order override. If NULL, uses catalog \`default_order\`
  if present.

- timeout_sec:

  Request timeout in seconds (default = 30).

- clean_names:

  Logical; if TRUE, convert column names to snake_case (default = TRUE).

- coerce_types:

  Logical; if TRUE, attempt light type coercion (default = TRUE).

## Value

A tibble.

## Examples

``` r
if (interactive() && curl::has_internet()) {
  # Pull by key
  nyc_pull_dataset("nyc_311_2010_2019", limit = 3)

  # Filters
  nyc_pull_dataset("nyc_311_2010_2019", limit = 3, filters = list(borough = "QUEENS"))
}
```
