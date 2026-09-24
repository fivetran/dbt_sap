# Decision Log

## The `hist_tax_factor` columns may come back empty

SAP stores `hist_tax_factor`, `hist_tax_factor1`, `hist_tax_factor2`, and `hist_tax_factor3` as raw bytes, and the `bsad`, `bsak`, and `bsid` compatibility views convert those bytes to text. Some warehouses allow that conversion only when the bytes spell valid text. These bytes often do not, and a single bad row fails the whole query, which made the views impossible to read.

Fivetran uses `dbt.safe_cast` on these four columns, so a value that cannot convert returns null instead of failing the query. This means the columns may come back empty. We chose empty columns over views you cannot query at all. No other column is affected, and values that do convert are returned as normal.

If you need these values, please open an issue on our [package issue page](https://github.com/fivetran/dbt_sap/issues). Returning them properly means decoding what SAP packs into the field, which is a larger change.
