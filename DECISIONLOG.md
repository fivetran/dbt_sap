# Decision Log

## The `hist_tax_factor` columns may come back empty

SAP stores `hist_tax_factor`, `hist_tax_factor1`, `hist_tax_factor2`, and `hist_tax_factor3` as raw bytes, and the `bsad`, `bsak`, and `bsid` compatibility views convert those bytes to text. Some warehouses allow that conversion only when the bytes spell valid text. These bytes often do not, and a single bad row fails the whole query, which made the views impossible to read.

On BigQuery, Fivetran uses `dbt.safe_cast` on these four columns, so a value that cannot convert returns null instead of failing the query. This means the columns may come back empty on BigQuery. We chose empty columns over views you cannot query at all. No other column is affected, and values that do convert are returned as normal.

On other destinations (Snowflake, Redshift, Databricks, Postgres), these columns use a plain `cast` instead. `dbt.safe_cast` compiles to `TRY_CAST` on Snowflake, which does not accept a `BINARY` source type at all and fails every run rather than just the bad rows, so the BigQuery-only workaround is not applied there. A plain `cast` has not been observed to fail on these destinations.

If you need these values, please open an issue on our [package issue page](https://github.com/fivetran/dbt_sap/issues). Returning them properly means decoding what SAP packs into the field, which is a larger change.
