<!--section="sap_transformation_model"-->
# Sap dbt Package

<p align="left">
    <a alt="License"
        href="https://github.com/fivetran/dbt_sap/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0,_<3.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
    <a alt="Fivetran Quickstart Compatible"
        href="https://fivetran.com/docs/transformations/data-models/quickstart-management#quickstartmanagement">
        <img src="https://img.shields.io/badge/Fivetran_Quickstart_Compatible%3F-yes-green.svg" /></a>
</p>

This dbt package transforms data from Fivetran's SAP connector into analytics-ready tables.

## Resources

- Number of materialized models¹: 133
- Connector documentation
  - [LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements)
  - [HVA SAP](https://fivetran.com/docs/databases/sap-erp/high-volume-agent)
  - [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana)
- dbt package documentation
  - [GitHub repository](https://github.com/fivetran/dbt_sap)
  - [dbt Docs](https://fivetran.github.io/dbt_sap/#!/overview)
  - [DAG](https://fivetran.github.io/dbt_sap/#!/overview?g_v=1)
  - [Changelog](https://github.com/fivetran/dbt_sap/blob/main/CHANGELOG.md)

## What does this dbt package do?
This package enables you to recreate common SAP extractor reports, provide a star schema for analyzing sales and purchase orders, and generate compatibility views. It creates enriched models with metrics focused on general ledger balances, sales and procurement transactions, and master data attributes.

Note: This package produces modeled tables that leverage SAP data from [Fivetran's SAP connectors, like LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements), [HVA SAP](https://fivetran.com/docs/databases/sap-erp/high-volume-agent) or [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana).

### Output schema
Final output tables are generated in the following target schema:

```
<your_database>.<connector/schema_name>_sap
```

### Final output tables

By default, this package materializes the following final tables:

**Extractor Reports**

| Table | Description |
| :---- | :---- |
| [sap__0comp_code_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0comp_code_attr) | Extracts company code master data with currency, fiscal year variant, chart of accounts, country, and credit control area attributes from the t001 source to support financial organizational reporting and multi-company analysis. <br></br>**Example Analytics Questions:**<ul><li>Which company codes (bukrs) use the same currency (waers) and fiscal year variant (periv)?</li><li>How are companies distributed across different countries (land1) and credit control areas (kkber)?</li><li>What is the relationship between chart of accounts (ktopl) and company code configurations?</li></ul>|
| [sap__0comp_code_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0comp_code_text) | Provides multi-language company code names and descriptions from the t001 source with language keys to enable localized financial reporting and support international company hierarchies. <br></br>**Example Analytics Questions:**<ul><li>What are the company code names (txtmd) across different languages (langu)?</li><li>Which company codes (bukrs) have text descriptions available in multiple languages?</li><li>How do company code naming conventions vary by language for the same bukrs?</li></ul>|
| [sap__0company_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0company_text) | Extracts company entity names from the t880 source providing company-level text descriptions to support corporate structure analysis and consolidated reporting hierarchies. <br></br>**Example Analytics Questions:**<ul><li>What are the distinct company names (txtmd) by company code (rcomp)?</li><li>How many company entities exist across different clients (mandt)?</li><li>Which companies (rcomp) have the most detailed naming information in txtmd?</li></ul>|
| [sap__0customer_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0customer_attr) | Consolidates customer master data from the kna1 source with demographic information (name, address, city, postal code, country, region), classification attributes (industry, account group, customer class), contact details (phone, tax numbers), and vendor linkages to support customer segmentation and CRM analytics. <br></br>**Example Analytics Questions:**<ul><li>How are customers distributed across countries (land1), regions (regio), and cities (ort01)?</li><li>Which customers have vendor relationships (lifnr) and how do those compare by industry key (brsch) or customer classification (kukla)?</li><li>What is the breakdown of customers by account group (ktokd) and industry codes (bran1-bran5)?</li></ul>|
| [sap__0employee_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0employee_attr) | Extracts employee work relationship data from personnel administration with organizational assignments (company code, plant, personnel area, cost center, organizational unit), position details (job, position, employee group/subgroup), compensation information (pay scale type/area/group/level, annual salary currency, employment percentage), and validity periods to analyze workforce structure and payroll planning. <br></br>**Example Analytics Questions:**<ul><li>How are employees distributed across company codes (bukrs), personnel areas (werks), cost centers (kostl), and organizational units (orgeh)?</li><li>What is the breakdown of employees by pay scale group (trfgr), pay scale level (trfst), and employment percentage (empct)?</li><li>Which positions (plans) and jobs (stell) have the highest capacity utilization levels (bsgrd) and employment status (stat2) values?</li></ul>|
| [sap__0fi_gl_10](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_10) | Aggregates GL transaction figures from the leading ledger with period-level debit/credit amounts, accumulated balances, and turnover by account, company code, cost center, profit center, segment, and other organizational dimensions to support P&L analysis, balance sheet reporting, and variance analysis. <br></br>**Example Analytics Questions:**<ul><li>What are the total debit_amount and credit_amount by GL account (racct), company code (rbukrs), and fiscal_period?</li><li>How do accumulated_balance and turnover trend over time by cost center (rcntr), profit center (prctr), and fiscal year (ryear)?</li><li>Which accounts have the largest differences between debit and credit amounts by segment, functional area (rfarea), and business area (rbusa)?</li></ul>|
| [sap__0fi_gl_14](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_14) | Streams detailed GL line items from the leading ledger with document-level details (document number, line number, posting date, document date), multi-currency amounts (transaction, local, global currencies), debit/credit indicators, posting keys, account assignments (GL account, cost center, profit center, order), and clearance information to enable granular financial transaction analysis and audit trails. <br></br>**Example Analytics Questions:**<ul><li>What is the total transaction amount (tsl) and local currency amount (hsl) by GL account (racct), company code (rbukrs), and posting period (poper)?</li><li>How many line items have been cleared (augbl, augdt) versus open by account, cost center (rcntr), and fiscal year (gjahr)?</li><li>Which posting keys (bschl) and document types (blart) generate the highest transaction volumes and amounts by debit/credit indicator (drcrk)?</li></ul>|
| [sap__0gl_account_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0gl_account_attr) | Extracts GL account master data from the ska1 source with chart of accounts assignments, account groups, P&L statement accounts, and balance sheet classifications to support account hierarchy reporting and financial statement mapping. <br></br>**Example Analytics Questions:**<ul><li>How are GL accounts distributed across different charts of accounts (ktopl) and account groups?</li><li>Which accounts are classified as P&L statement accounts versus balance sheet accounts?</li><li>What is the account hierarchy structure and grouping by chart of accounts?</li></ul>|
| [sap__0material_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0material_attr) | Consolidates material master attributes from the mara source with material type, base unit of measure, material group, gross/net weights, volume, size dimensions, and classification indicators to support inventory management, procurement planning, and product analytics. <br></br>**Example Analytics Questions:**<ul><li>How are materials distributed across material types, material groups, and base units of measure?</li><li>What is the average gross weight, net weight, and volume by material type and material group?</li><li>Which materials have specific classification indicators (batch management, serial number profile, etc.)?</li></ul>|
| [sap__0vendor_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0vendor_attr) | Extracts vendor master attributes from the lfa1 source with vendor names, addresses (street, city, postal code, country, region), contact details (telephone, fax), account group classifications, industry keys, payment terms, and tax information to support supplier management, procurement analytics, and vendor performance tracking. <br></br>**Example Analytics Questions:**<ul><li>How are vendors distributed across countries, regions, and cities?</li><li>Which vendors belong to specific account groups and industry classifications?</li><li>What are the common payment terms and tax configurations by vendor type?</li></ul>|
| [sap__0vendor_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0vendor_text) | Provides multi-language vendor names and text descriptions from the lfa1 source with language keys to enable localized vendor reporting and support international supplier communications. <br></br>**Example Analytics Questions:**<ul><li>What are the vendor names across different languages for the same vendor number?</li><li>Which vendors have text descriptions available in multiple languages?</li><li>How do vendor naming conventions vary by language and country?</li></ul>|

**Sales and Procurement**

| Table | Description |
| :---- | :---- |
| [sap__dim_customer](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_customer) | Dimensional customer table with English-labeled fields including customer number, country, customer name, city, and surrogate key from the kna1 source to enable customer-centric dimensional reporting and simplified business user analytics. <br></br>**Example Analytics Questions:**<ul><li>How many customers exist by country_key_id and city?</li><li>Which customers (customer_name) have the most sales or transaction activity by customer_id?</li><li>What is the geographic distribution of customers across countries and cities?</li></ul>|
| [sap__dim_material](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_material) | Dimensional material table with English-labeled fields combining material master data (mara), material descriptions (makt), and material type attributes (t134/t134t) including material number, description, type, base unit of measure, gross weight, and surrogate key to enable product-centric dimensional analysis. <br></br>**Example Analytics Questions:**<ul><li>What is the breakdown of materials by material_type_id and material_type_description?</li><li>Which materials have the highest gross_weight and how are they distributed by material_type?</li><li>What are the common base_uom_id values by material type and product category?</li></ul>|
| [sap__dim_plant](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_plant) | Dimensional plant/branch table with English-labeled fields from the t001w source including plant identifier, plant name, country key, and related attributes to enable plant-centric operational and logistics reporting. <br></br>**Example Analytics Questions:**<ul><li>How many plants exist by country_key_id?</li><li>Which plants (plant_name) have the most production or logistics activity by plant_id?</li><li>What is the geographic distribution of plants across different countries?</li></ul>|
| [sap__dim_purchasing_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_order) | Dimensional purchasing document header table with English-labeled fields combining purchase order attributes (ekko) and reference data (dd07l/dd07t/t024/t161) including document category, type, status, purchasing group, payment terms, and cancellation reason to enable procurement header-level dimensional analysis. <br></br>**Example Analytics Questions:**<ul><li>How are purchasing documents distributed by purchasing_document_category and purchasing_document_type_id?</li><li>Which purchasing groups (purchasing_group_id, description_purchasing_group) process the most purchase orders by status?</li><li>What are the most common cancellation reasons (reason_cancellation_id) by purchasing document type and company code?</li></ul>|
| [sap__dim_purchasing_organization](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_organization) | Dimensional purchasing organization table with English-labeled fields from t024e and t024et sources including organization identifier, description, and company code assignment to enable purchasing organization-level procurement analytics and reporting. <br></br>**Example Analytics Questions:**<ul><li>How many purchasing organizations exist by company_code_id?</li><li>Which purchasing organizations (description) process the most procurement volume by purchasing_organization_id?</li><li>What is the relationship between company codes and their assigned purchasing organizations?</li></ul>|
| [sap__dim_rejection_reason](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_rejection_reason) | Dimensional rejection reason table with English-labeled fields from tvag and tvagt sources including reason code and description to enable rejection reason analysis for sales and procurement documents. <br></br>**Example Analytics Questions:**<ul><li>What are the most common rejection reasons (rejection_reason_description) by reason_rejection_id?</li><li>How do rejection reasons vary between sales and purchasing document types?</li><li>Which rejection reason codes have the highest occurrence rates in transactions?</li></ul>|
| [sap__dim_vendor](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_vendor) | Dimensional vendor table with English-labeled fields from the lfa1 source including vendor identifier, country, vendor names, city, sort field, authorization group, industry classification, and account group to enable supplier-centric dimensional reporting and vendor performance analytics. <br></br>**Example Analytics Questions:**<ul><li>How are vendors distributed across country_key_id, city, and industry_key_id?</li><li>Which vendors (name, name_2) belong to specific vendor_account_group_id and authorization_group_id combinations?</li><li>What is the breakdown of vendors by industry classification and geographic location?</li></ul>|
| [sap__fact_purchasing_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_vendor) | Fact table consolidating purchasing order line-level metrics from ekbe, eket, ekko, ekpo, and t001w sources with quantity metrics (ordered, open, delivered, late, canceled), amount metrics (order value, open amount, delivered amount, late amount, canceled amount, invoiced amount), delivery performance (delivery late days, late lead days, delivery completed), and item counts to measure procurement efficiency, supplier performance, and purchase order fulfillment. <br></br>**Example Analytics Questions:**<ul><li>What is the total purchase_order_amount and purchase_delivered_amount by vendor_id, material_id, and plant_id?</li><li>How do purchase_order_quantity versus purchase_open_quantity and purchasing_delivered_quantity compare by purchasing_group_id over time?</li><li>Which vendors have the highest purchase_late_amount and purchase_deliver_late_days by purchasing_organization_id?</li></ul>|
| [sap__fact_sales_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__fact_sales_order) | Fact table consolidating sales order line-level data from vbak, vbap, vbuk, and vbup sources with document attributes (document number, item, category, type, order reason, delivery block), organizational dimensions (sales organization, distribution channel, division, plant, customer), product details (material, material group, product hierarchy), quantity and pricing metrics (order quantity, net value, net price, gross weight), dates (document date, requested delivery date, created date), and status indicators (delivery status, overall status, item delivery status) to measure sales performance and order fulfillment. <br></br>**Example Analytics Questions:**<ul><li>What is the total net_value and order_quantity by sold_to_customer_id, material_id, and sales_organization_id?</li><li>How do sales vary by sales_document_type_id, distribution_channel_id, and division_id over time (document_date)?</li><li>Which materials have the highest order volumes and net prices by product_hierarchy_id and plant_id?</li></ul>|

**Compatibility Views**

| Table | Description |
| :---- | :---- |
| [coss](https://fivetran.github.io/dbt_sap/#!/model/model.sap.coss) | Cost Object Summary (COSS) compatibility view - Provides period-wise cost and quantity data for cost objects from controlling documents, replicating the native SAP COSS table structure. |
| [faglflexa](https://fivetran.github.io/dbt_sap/#!/model/model.sap.faglflexa) | Financial General Ledger Line Items (FAGLFLEXA) compatibility view - Provides detailed line item data from financial accounting documents, maintaining compatibility with native SAP FAGLFLEXA table. |
| [marc](https://fivetran.github.io/dbt_sap/#!/model/model.sap.marc) | Material Master Plant Data (MARC) compatibility view - Contains plant-specific material master data including MRP, procurement, and stock information, replicating the native SAP MARC table structure. |
| [mchb](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mchb) | Batch Stocks (MCHB) compatibility view - Contains batch-specific stock quantities and valuations for each material and storage location, maintaining compatibility with native SAP MCHB table. |
| [mkpf](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mkpf) | Material Document Header (MKPF) compatibility view - Contains header-level information for material documents from goods movements, replicating the native SAP MKPF table structure. |
| [mseg](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mseg) | Material Document Line Items (MSEG) compatibility view - Contains detailed line item information for all material movement transactions, maintaining compatibility with native SAP MSEG table. |

¹ Each Quickstart transformation job run materializes these models if all components of this data model are enabled. This count includes all staging, intermediate, and final models materialized as `view`, `table`, or `incremental`.

---

## Prerequisites
To use this dbt package, you must have the following:

- At least one Fivetran SAP connection:
   - [LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements)
   - [HVA SAP](https://fivetran.com/docs/databases/sap-erp/high-volume-agent)
   - [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana)
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, **Databricks** destination.

## How do I use the dbt package?
You can either add this dbt package in the Fivetran dashboard or import it into your dbt project:

- To add the package in the Fivetran dashboard, follow our [Quickstart guide](https://fivetran.com/docs/transformations/data-models/quickstart-management).
- To add the package to your dbt project, follow the setup instructions in the dbt package's [README file](https://github.com/fivetran/dbt_sap/blob/main/README.md#how-do-i-use-the-dbt-package) to use this package.

<!--section-end-->

### Install the package
Include the following sap package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/sap
    version: [">=0.6.0", "<0.7.0"]
```

#### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Define database and schema variables
By default, this package runs using your destination and the `sap` schema. If this is not where your sap data is (for example, if your sap schema is named `sap_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    sap_database: your_destination_name
    sap_schema: your_schema_name 
```

### (Optional) Additional configurations
<details open><summary>Expand/collapse details</summary>
<br>

#### Disable individual sources
All source tables are enabled by default, but you can disable any of them by setting their `sap_using_*` variable to `false` in your `dbt_project.yml`. Example usage:

```yml
vars:
    sap_using_vbak: false # default is true.
    sap_using_vbap: false # default is true.
    sap_using_ekko: false # default is true.
    # ...additional sap_using_* variables
```

#### Filter the data you bring in with field variable conditionals
By default, these models are set to bring in all your data from SAP, but you may be interested in bringing in only a smaller sample of data given the relative size of the SAP source tables.

We have set up where conditions in our data to allow you to bring in only the data you need to run in. Configure the below variables in your `dbt_project.yml` to bring in only the rows that return these values in the fields specified.

```yml
vars:
    bkpf_mandt_var: 'value1' # The client field in the `sap__0fi_gl_14` model, this filter allows you to parse down to one client's records.
    kna1_mandt_var: 'value2' # The client field in the `sap__0customer_attr` model, this filter allows you to parse down to one client's records.
    lfa1_mandt_var: 'value3' # The client field in the `sap__0vendor_attr` model, this filter allows you to parse down to one client's records.
    mara_mandt_var: 'value4' # The client field in the `sap__0vendor_attr` model, this filter allows you to parse down to one client's records.
    ska1_mandt_var: 'value5' # The client field in the `sap__0gl_account_attr` model, this filter allows you to parse down to one client's records.
    t001_mandt_var: 'value6' # The client field in the `sap__0comp_code_attr` model, this filter allows you to parse down to one client's records.
    faglflexa_rldnr_var: 'value7' # The ledger field in the `sap__0fi_gl_14` model, this filter allows you to parse down to one ledger's records.
    faglflext_rbukrs_var: 'value8' # The company code field in the `sap__0fi_gl_10` model, this filter allows you to parse down to one company's records.
    faglflext_rclnt_var: 'value9' # The client in the `sap__0fi_gl_10` model, this filter allows you to parse down to one client's records.
    faglflext_rldnr_var: 'value10' # The ledger account field in the `sap__0fi_gl_10` model, this filter allows you to parse down to one ledger account's records.
    faglflext_ryear_var: 'value11' # The fiscal year in the `sap__0fi_gl_10` model, this filter allows you to parse down to one fiscal year.
```

#### Change the build schema
By default, this package builds the SAP staging models within a schema titled (`<target_schema>` + `sap_source`) and the SAP final models within a schema titled (<target_schema> + `sap`) in your target database. If this is not where you would like your modeled sap data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    sap:
      +schema: my_new_schema_name # leave blank for just the target_schema
      staging:
        +schema: my_new_schema_name # leave blank for just the target_schema
```

#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_sap/blob/main/dbt_project.yml) variable declarations to see the expected names.

```yml
vars:
    sap_<default_source_table_name>_identifier: your_table_name
```

</details>

### (Optional) Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt#transformationsfordbtcore). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt/setup-guide#transformationsfordbtcoresetupguide).
</details>

## Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.3.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```

<!--section="sap_maintenance"-->
## How is this package maintained and can I contribute?

### Package Maintenance
The Fivetran team maintaining this package only maintains the [latest version](https://hub.getdbt.com/fivetran/sap/latest/) of the package. We highly recommend you stay consistent with the latest version of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_sap/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Learn how to contribute to a package in dbt's [Contributing to an external dbt package article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657).

<!--section-end-->

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_sap/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
