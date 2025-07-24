# dbt_sap v0.2.0
[PR #25](https://github.com/fivetran/dbt_sap/pull/25) includes the following updates:

## Schema & Data Updates
**75 total changes • 4 possible breaking changes.**

| Data Model | Change Type | Old Name | New Name | Notes |
| --- | --- | --- | --- | --- |
| [`stg_sap__lfa1`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__lfa1) | New columns |  |  | Refer to the linked documentation for the full column list. |
| [`stg_sap__mara`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__mara) | New columns |  |  | Refer to the linked documentation for the full column list. |
| [`stg_sap__t001`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t001) | New columns |  |  | Refer to the linked documentation for the full column list. |
| [`stg_sap__t001w`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t001w) | New columns |  |  | Refer to the linked documentation for the full column list. |
| [`sap__dim_customer`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_customer) | New model |  |  | Dimension model for SAP customers (`kna1`). |
| [`sap__dim_material`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_material) | New model |  |  | Dimension model for SAP materials (`mara`). |
| [`sap__dim_plant`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_plant) | New model |  |  | Dimension model for SAP plants (`t001w`). |
| [`sap__dim_purchasing_order`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_order) | New model |  |  | Dimension model for purchasing orders (`ekko`). |
| [`sap__dim_purchasing_organization`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_organization) | New model |  |  | Dimension model for purchasing organizations (`t024e`). |
| [`sap__dim_rejection_reason`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_rejection_reason) | New model |  |  | Dimension model for sales order rejection reasons (`tvag`). |
| [`sap__dim_vendor`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_vendor) | New model |  |  | Dimension model for vendors (`lfa1`). |
| [`sap__fact_purchasing_order`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__fact_purchasing_order) | New model |  |  | Fact model for purchasing order data (`ekko`, `ekpo`, `eket`). |
| [`sap__fact_sales_order`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__fact_sales_order) | New model |  |  | Fact model for sales order data (`vbak`, `vbap`). |
| [`int_sap__company`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__company) | New model |  |  | Intermediate model for companies (`t001`). |
| [`int_sap__customer`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__customer) | New model |  |  | Intermediate model for customers (`kna1`). |
| [`int_sap__material`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__material) | New model |  |  | Intermediate model for materials (`mara`). |
| [`int_sap__material_type`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__material_type) | New model |  |  | Intermediate model for material types (`t134`). |
| [`int_sap__plant`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__plant) | New model |  |  | Intermediate model for plants (`t001w`). |
| [`int_sap__purchasing_document_category`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_category) | New model |  |  | Intermediate model for purchasing doc categories (`dd07l`). |
| [`int_sap__purchasing_document_header`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_header) | New model |  |  | Intermediate model for purchasing document headers (`ekko`). |
| [`int_sap__purchasing_document_history`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_history) | New model |  |  | Intermediate model for purchasing document history (`ekbe`). |
| [`int_sap__purchasing_document_item`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_item) | New model |  |  | Intermediate model for purchasing document items (`ekpo`). |
| [`int_sap__purchasing_document_overview`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_overview) | New model |  |  | Intermediate model for rollup of `int_sap__purchasing_document_history`. |
| [`int_sap__purchasing_document_schedule_line`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_schedule_line) | New model |  |  | Intermediate model for purchasing schedules (`eket`). |
| [`int_sap__purchasing_document_schedule_total`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_schedule_total) | New model |  |  | Intermediate model for rollup of `int_sap__purchasing_document_schedule_line`. |
| [`int_sap__purchasing_document_status`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_status) | New model |  |  | Intermediate model for purchasing document statuses (`dd07l`). |
| [`int_sap__purchasing_document_type`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_document_type) | New model |  |  | Intermediate model for purchasing doc types (`t161`). |
| [`int_sap__purchasing_group`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_group) | New model |  |  | Intermediate model for purchasing groups (`t024`). |
| [`int_sap__purchasing_organization`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__purchasing_organization) | New model |  |  | Intermediate model for purchasing organizations (`t024e`). |
| [`int_sap__sales_document_header`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__sales_document_header) | New model |  |  | Intermediate model for sales document headers (`vbak`). |
| [`int_sap__sales_document_header_status`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__sales_document_header_status) | New model |  |  | Intermediate model for sales doc header statuses (`vbuk`). |
| [`int_sap__sales_document_item`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__sales_document_item) | New model |  |  | Intermediate model for sales document items (`vbap`). |
| [`int_sap__sales_document_item_status`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__sales_document_item_status) | New model |  |  | Intermediate model for sales doc item statuses (`vbup`). |
| [`int_sap__sales_document_rejection_reason`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__sales_document_rejection_reason) | New model |  |  | Intermediate model for sales rejection reasons (`tvag`). |
| [`int_sap__vendor`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.int_sap__vendor) | New model |  |  | Intermediate model for vendors (`lfa1`). |
| [`stg_sap__dd07l`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__dd07l) | New model |  |  | Staging model for domain values (`dd07l`). |
| [`stg_sap__dd07t`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__dd07t) | New model |  |  | Staging model for domain value descriptions (`dd07t`). |
| [`stg_sap__ekbe`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekbe) | New model |  |  | Staging model for purchasing document history (`ekbe`). |
| [`stg_sap__eket`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__eket) | New model |  |  | Staging model for purchasing schedule lines (`eket`). |
| [`stg_sap__ekko`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekko) | New model |  |  | Staging model for purchasing document headers (`ekko`). |
| [`stg_sap__ekpo`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekpo) | New model |  |  | Staging model for purchasing document items (`ekpo`). |
| [`stg_sap__makt`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__makt) | New model |  |  | Staging model for material descriptions (`makt`). |
| [`stg_sap__t001w`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t001w) | New model |  |  | Staging model for plants (`t001w`). |
| [`stg_sap__t024`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t024) | New model |  |  | Staging model for purchasing groups (`t024`). |
| [`stg_sap__t024e`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t024e) | New model |  |  | Staging model for purchasing organizations (`t024e`). |
| [`stg_sap__t134`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t134) | New model |  |  | Staging model for material types (`t134`). |
| [`stg_sap__t134t`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t134t) | New model |  |  | Staging model for material type descriptions (`t134t`). |
| [`stg_sap__t161`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t161) | New model |  |  | Staging model for purchasing document types (`t161`). |
| [`stg_sap__t161t`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t161t) | New model |  |  | Staging model for purchasing document type descriptions (`t161t`). |
| [`stg_sap__tvag`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__tvag) | New model |  |  | Staging model for sales document rejection reasons (`tvag`). |
| [`stg_sap__tvagt`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__tvagt) | New model |  |  | Staging model for rejection reason descriptions (`tvagt`). |
| [`stg_sap__vbak`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbak) | New model |  |  | Staging model for sales document headers (`vbak`). |
| [`stg_sap__vbap`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbap) | New model |  |  | Staging model for sales document items (`vbap`). |
| [`stg_sap__vbuk`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbuk) | New model |  |  | Staging model for sales document header status (`vbuk`). |
| [`stg_sap__vbup`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbup) | New model |  |  | Staging model for sales document item status (`vbup`). |
| [`stg_sap__dd07l_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__dd07l_tmp) | New model |  |  | Temporary model for domain values (`dd07l`). |
| [`stg_sap__dd07t_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__dd07t_tmp) | New model |  |  | Temporary model for domain value descriptions (`dd07t`). |
| [`stg_sap__ekbe_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekbe_tmp) | New model |  |  | Temporary model for purchasing document history (`ekbe`). |
| [`stg_sap__eket_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__eket_tmp) | New model |  |  | Temporary model for purchasing schedule lines (`eket`). |
| [`stg_sap__ekko_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekko_tmp) | New model |  |  | Temporary model for purchasing document headers (`ekko`). |
| [`stg_sap__ekpo_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__ekpo_tmp) | New model |  |  | Temporary model for purchasing document items (`ekpo`). |
| [`stg_sap__makt_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__makt_tmp) | New model |  |  | Temporary model for material descriptions (`makt`). |
| [`stg_sap__t001w_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t001w_tmp) | New model |  |  | Temporary model for plants (`t001w`). |
| [`stg_sap__t024_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t024_tmp) | New model |  |  | Temporary model for purchasing groups (`t024`). |
| [`stg_sap__t024e_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t024e_tmp) | New model |  |  | Temporary model for purchasing organizations (`t024e`). |
| [`stg_sap__t134_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t134_tmp) | New model |  |  | Temporary model for material types (`t134`). |
| [`stg_sap__t134t_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t134t_tmp) | New model |  |  | Temporary model for material type descriptions (`t134t`). |
| [`stg_sap__t161_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t161_tmp) | New model |  |  | Temporary model for purchasing document types (`t161`). |
| [`stg_sap__t161t_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__t161t_tmp) | New model |  |  | Temporary model for purchasing document type descriptions (`t161t`). |
| [`stg_sap__tvag_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__tvag_tmp) | New model |  |  | Temporary model for sales document rejection reasons (`tvag`). |
| [`stg_sap__tvagt_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__tvagt_tmp) | New model |  |  | Temporary model for rejection reason descriptions (`tvagt`). |
| [`stg_sap__vbak_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbak_tmp) | New model |  |  | Temporary model for sales document headers (`vbak`). |
| [`stg_sap__vbap_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbap_tmp) | New model |  |  | Temporary model for sales document items (`vbap`). |
| [`stg_sap__vbuk_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbuk_tmp) | New model |  |  | Temporary model for sales document header status (`vbuk`). |
| [`stg_sap__vbup_tmp`](https://fivetran.github.io/dbt_sap/#!/model/model.sap.stg_sap__vbup_tmp) | New model |  |  | Temporary model for sales document item status (`vbup`). |

## Breaking Change
- **Consolidated `dbt_sap_source` into this package**  
  - All functionality from the [`dbt_sap_source`](https://github.com/fivetran/dbt_sap_source) package has been merged into this transformation package. The source package remains available but is no longer required when using this package.  
  > **If you have any reference to `fivetran/sap_source` in your `packages.yml`, it should be removed.**

## Features
- **Added `sap_using_*` variables for modular staging**  
  - The package now supports `sap_using_*` variables, which are set to true by default, that will allow you to disable individual staging tables. This allows you to control which raw tables are processed based on the data available in your SAP extract. Example usage in `dbt_project.yml`:
  ```yaml
  vars:
    sap_using_vbap: false
    sap_using_ekko: false
  ```
  - See the [README](https://github.com/fivetran/dbt_sap/blob/main/README.md#disable-individual-sources) for more details.

- **Added variable `sales_and_procurement_mandt_var` to filter by client**  
  - This new variable `sales_and_procurement_mandt_var` enables filtering the new fact and dimension models (such as sales and purchasing documents) by SAP client (`mandt`). This is useful in multi-client SAP systems to isolate records for a specific client. Example usage:
  ```yaml
  vars:
    sales_and_procurement_mandt_var: ['100', '200', '300', '800'] # This sets the filter used in the sales_and_procurement models. The default is ['800'].
  ```
  - See the [README](https://github.com/fivetran/dbt_sap/blob/main/README.md#filter-the-data-you-bring-in-with-field-variable-conditionals) for more details.

[PR #26](https://github.com/fivetran/dbt_sap/pull/26) includes the following updates:

### Under the Hood - July 2025 Updates

- Updated conditions in `.github/workflows/auto-release.yml`.
- Added `.github/workflows/generate-docs.yml`.
- Added `+docs: show: False` to `integration_tests/dbt_project.yml`.
- Migrated `flags` (e.g., `send_anonymous_usage_stats`, `use_colors`) from `sample.profiles.yml` to `integration_tests/dbt_project.yml`.
- Updated `maintainer_pull_request_template.md` with improved checklist.
- Refreshed README tag block:
  - Standardized Quickstart-compatible badge set
  - Left-aligned and positioned below the H1 title.
- Updated Python image version to `3.10.13` in `pipeline.yml`.
- Updated `.gitignore` to exclude additional DBT, Python, and system artifacts.

[PR #10](https://github.com/fivetran/dbt_sap/pull/10) includes the following updates:

## Documentation
- Added Quickstart model counts to README. 
- Corrected references to connectors and connections in the README.

# dbt_sap v0.1.0  
🎉 This is the initial release of this package! 🎉

## 📣 What does this dbt package do?
- Provides recreations of the SAP extractor models to enable you to better understand your SAP data. The package achieves this by performing the following: 
    - Brings in essential master attribute tables like Company Code (`sap__0comp_code_attr`), Customer Master (`sap__0customer_attr`), Employee (`sap__0employee_attr`), G/L Account Number (`sap__0gl_account_attr`), Material Data (`sap__0material_attr`), and Vendor Number (`sap__0vendor_attr`).
    - Brings in general ledger models like General Ledger: Balances, Leading Ledger (`sap__0fi_gl_10`) and Line Items Leading Ledger (`sap__0fi_gl_14`).
    - Brings in master text models like Company Code (`sap__0comp_code_text`), Company (`sap__0company_text`), and Vendor (`sap__0vendor_text`).
- Produces modeled tables that leverage SAP data from [Fivetran's SAP connectors, like LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements), [HVA SAP ECC](https://fivetran.com/docs/databases/sap-erp/high-volume-agent/hva-sap-ecc-hana) or [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana) and build off the output of our [SAP source package](https://github.com/fivetran/dbt_sap_source).
- Generates a comprehensive data dictionary of your source and modeled sap data through the [dbt docs site](https://fivetran.github.io/dbt_sap/).
 
For more information, refer to the [README](https://github.com/fivetran/dbt_sap/blob/main/README.md).
