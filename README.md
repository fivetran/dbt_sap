# SAP Transformation dbt Package ([Docs](https://fivetran.github.io/dbt_sap/))

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
        href="https://fivetran.com/docs/transformations/dbt/quickstart">
        <img src="https://img.shields.io/badge/Fivetran_Quickstart_Compatible%3F-yes-green.svg" /></a>
</p>

## What does this dbt package do?
- Recreates common SAP extractor reports and provides a star schema for analyzing sales and purchase orders.
    - Brings in essential master attribute tables like Company Code (`sap__0comp_code_attr`), Customer Master (`sap__0customer_attr`), Employee (`sap__0employee_attr`), G/L Account Number (`sap__0gl_account_attr`), Material Data (`sap__0material_attr`), and Vendor Number (`sap__0vendor_attr`).
    - Brings in general ledger models like General Ledger: Balances, Leading Ledger (`sap__0fi_gl_10`) and Line Items Leading Ledger (`sap__0fi_gl_14`).
    - Brings in master text models like Company Code (`sap__0comp_code_text`), Company (`sap__0company_text`), and Vendor (`sap__0vendor_text`).
    - Provides sales and procurement models including facts and dimensions for purchase and sales orders.
    - Provides compatibility views to help maintain backwards compatibility.
- Produces modeled tables that leverage SAP data from [Fivetran's SAP connectors, like LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements), [HVA SAP](https://fivetran.com/docs/databases/sap-erp/high-volume-agent) or [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana).
- Generates a comprehensive data dictionary of your source and modeled sap data through the [dbt docs site](https://fivetran.github.io/dbt_sap/).

<!--section=“sap_transformation_model"-->

The following tables provide a detailed list of all tables materialized within this package by default.
> TIP: See more details about these tables in the package's [dbt docs site](https://fivetran.github.io/dbt_sap/#!/overview?g_v=1).

## Extractor Reports

| **Table**                         | **Description**                                                                                                                                                                                                                             |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [sap__0comp_code_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0comp_code_attr)    |  This model is used for loading company code attributes, extracting from the `t001` data source.                              |
| [sap__0comp_code_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0comp_code_text)    |  This model is used for loading company code text information, extracting from the `t001` data source.   |
| [sap__0company_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0company_text) |  This model is used for loading customer text data, extracting from the `t880` data source.   |
| [sap__0customer_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0customer_attr)    |  This model is used for loading customer master data, originating from the `kna1` source.                               |
| [sap__0employee_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0employee_attr)    | This model contains information that concerns the employee's work relationship, extracting master data from the personnel administration tables. |
| [sap__0fi_gl_10](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_10)    | This model extracts the transaction figures from the leading ledger in the new General Ledger.  |
| [sap__0fi_gl_14](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_14)  | This model extracts line items from the leading ledger in new General Ledger Accounting.                                                                |
| [sap__0gl_account_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0gl_account_attr)    |   This model is used for loading G/L Account Number master data, originating from the `ska1` source.                 |
| [sap__0material_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0material_attr)    |  This model is used to display material attribute information, originating from the `mara` source.                                                           |
| [sap__0vendor_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0vendor_attr)    |  This model is used to display vendor attributes, originating from the `lfa1` source.                           |
| [sap__0vendor_text](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0vendor_text) |  This model is used to display vendor text, originating from the `lfa1` source.     |

## Sales and Procurement

| **Table**                         | **Description**                                                                                                                                                                                                                             |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [sap__dim_customer](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_customer) | Represents customer dimension data from the `kna1` source to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_material](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_material) | Provides enriched material and material type data by combining attributes from the `mara`, `makt`, `t134`, and `t134t` sources to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_plant](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_plant) | Delivers plant-level dimension data from the `t001w` source to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_purchasing_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_order) | Provides enriched purchase order data by combining attributes from the `ekko`, `dd07l`, `dd07t`, `t024`, and `t161` sources to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_purchasing_organization](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_purchasing_organization) | Provides enriched purchasing organization data by combining attributes from the `t024e`, `t024et`, and related sources to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_rejection_reason](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_rejection_reason) | Provides enriched sales rejection reason data by combining attributes from the `tvag` and `tvagt` sources to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__dim_vendor](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_vendor) | Represents vendor dimension data from the `lfa1` source to support dimensional reporting. SAP field names are mapped to English readable column names. |
| [sap__fact_purchasing_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__dim_vendor) | Consolidates purchase order fact data from the `ekbe`, `eket`, `ekko`, `ekpo`, and `t001w` sources, representing transactional procurement activity across line items and orders. SAP field names are mapped to English readable column names. |
| [sap__fact_sales_order](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__fact_sales_order) | Contains fact-level sales order data, integrating records from `vbak`, `vbap`, `vbuk`, and `vbup` sources to provide visibility into sales transaction performance. SAP field names are mapped to English readable column names. |

### Compatibility Views
The following models provide compatibility views that replicate the structure and data of native SAP tables, enabling seamless migration and integration for existing SAP-based processes and reports.

| **Table**                         | **Description**                                                                                                                                                                                                                             |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [bsad](https://fivetran.github.io/dbt_sap/#!/model/model.sap.bsad) | Customer Cleared Items (BSAD) compatibility view - Provides cleared customer accounting line items combining archived and active records, replicating the native SAP BSAD table structure. |
| [bsid](https://fivetran.github.io/dbt_sap/#!/model/model.sap.bsid) | Customer Open Items (BSID) compatibility view - Contains open customer accounting line items from active documents, maintaining compatibility with native SAP BSID table. |
| [coep](https://fivetran.github.io/dbt_sap/#!/model/model.sap.coep) | Cost Object Line Items (COEP) compatibility view - Provides line item data for cost objects combining original COEP data with derived ACDOCA records for actual postings, replicating the native SAP COEP table structure. |
| [cosp](https://fivetran.github.io/dbt_sap/#!/model/model.sap.cosp) | Cost Object Summarization (COSP) compatibility view - Contains period-wise summarized cost and quantity data for cost objects combining archived COSP_BAK data with aggregated ACDOCA actuals, maintaining compatibility with native SAP COSP table. |
| [coss](https://fivetran.github.io/dbt_sap/#!/model/model.sap.coss) | Cost Object Summary (COSS) compatibility view - Provides period-wise cost and quantity data for cost objects from controlling documents, replicating the native SAP COSS table structure. |
| [faglflexa](https://fivetran.github.io/dbt_sap/#!/model/model.sap.faglflexa) | Financial General Ledger Line Items (FAGLFLEXA) compatibility view - Provides detailed line item data from financial accounting documents, maintaining compatibility with native SAP FAGLFLEXA table. |
| [marc](https://fivetran.github.io/dbt_sap/#!/model/model.sap.marc) | Material Master Plant Data (MARC) compatibility view - Contains plant-specific material master data including MRP, procurement, and stock information, replicating the native SAP MARC table structure. |
| [mchb](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mchb) | Batch Stocks (MCHB) compatibility view - Contains batch-specific stock quantities and valuations for each material and storage location, maintaining compatibility with native SAP MCHB table. |
| [mkpf](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mkpf) | Material Document Header (MKPF) compatibility view - Contains header-level information for material documents from goods movements, replicating the native SAP MKPF table structure. |
| [mseg](https://fivetran.github.io/dbt_sap/#!/model/model.sap.mseg) | Material Document Line Items (MSEG) compatibility view - Contains detailed line item information for all material movement transactions, maintaining compatibility with native SAP MSEG table. |

### Materialized Models
Each Quickstart transformation job run materializes 148 models if all components of this data model are enabled. This count includes all staging, intermediate, and final models materialized as `view`, `table`, or `incremental`.
<!--section-end-->

## How do I use the dbt package?
### Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran SAP connection:
   - [LDP SAP Netweaver](https://fivetran.com/docs/local-data-processing/requirements/source-and-target-requirements/sap-netweaver-requirements)
   - [HVA SAP](https://fivetran.com/docs/databases/sap-erp/high-volume-agent)
   - [SAP ERP on HANA](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana)
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, **Databricks** destination.

#### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Step 2: Install the package
Include the following sap package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/sap
    version: [">=0.6.0", "<0.7.0"]

```

### Step 3: Define database and schema variables
By default, this package runs using your destination and the `sap` schema. If this is not where your sap data is (for example, if your sap schema is named `sap_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    sap_database: your_destination_name
    sap_schema: your_schema_name 
```

### (Optional) Step 4: Additional configurations
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

### (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
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

## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/sap/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_sap/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package.

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_sap/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
