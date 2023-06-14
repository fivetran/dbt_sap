<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_sap/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.0.0_,<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# SAP Transformation dbt Package ([Docs](https://fivetran.github.io/dbt_sap/))

# 📣 What does this dbt package do?
- Produces modeled tables that leverage SAP data from [Fivetran's connector](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana) and build off the output of our [SAP source package](https://github.com/fivetran/dbt_sap_source).
- Enables you to better understand your SAP data. The package achieves this by performing the following: 
    - Brings in essential attribute tables like Company Code (`sap__0comp_code_attr`), Customer Master  (`sap__0customer_attr`), G/L Account Number (`sap__0gl_account_attr`), Material Data (`sap__0material_attr`), and Vendor Number (`sap__0vendor_attr`).
    - Adds general ledger models like General Ledger: Balances, Leading Ledger (`sap__0fi_gl_10`) and Line Items Leading Ledger (`sap__0fi_gl_14`).
- Generates a comprehensive data dictionary of your source and modeled sap data through the [dbt docs site](https://fivetran.github.io/dbt_sap/).


The following table provides a detailed list of all models materialized within this package by default. 
> TIP: See more details about these models in the package's [dbt docs site](https://fivetran.github.io/dbt_sap/#!/overview?g_v=1).

| **model**                         | **description**                                                                                                                                                                                                                             |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [sap__0comp_code_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0comp_code_attr)    |  Access the company code attributes.                               |
| [sap__0customer_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0customer_attr)    |  Access the customer master data attributes.                               |
| [sap__0fi_gl_10](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_10)    | Access the totals records from the leading ledger in the new general ledger.  |
| [sap__0fi_gl_14](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0fi_gl_14)  | Access line items of the leading ledger,  contains all line items that have been extracted from the source system.                                                                     |                            
| [sap__0gl_account_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0gl_account_attr)    |  Access the general ledger account number attribute.              |
| [sap__0material_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0material_attr)    |  Access the material master data from the source system.                                                          |
| [sap__0vendor_attr](https://fivetran.github.io/dbt_sap/#!/model/model.sap.sap__0vendor_attr)    |  Access the vendor master data attributes.                               |

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran SAP connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, **Databricks** destination.

### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

## Step 2: Install the package
Include the following sap_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
- git: https://github.com/fivetran/dbt_sap.git 
  revision: main
  warn-unpinned: false
```

Do NOT include the `sap_source` package in this file. The transformation package itself has a dependency on it and will install the source package as well.

## Step 3: Define database and schema variables
By default, this package runs using your destination and the `sap` schema. If this is not where your sap data is (for example, if your sap schema is named `sap_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    sap_database: your_destination_name
    sap_schema: your_schema_name 
```

## (Optional) Step 4: Additional configurations
<details><summary>Expand to view details</summary>
<br>

### Filter the data you bring in with field variable conditionals
By default, these models are set to bring in all your data from SAP, but you may be interested in bringing in only a smaller sample of data given the relative size of the SAP source tables.

We have set up where conditions in our data to allow you to bring in only the data you need to run in. Configure the below variables in your `dbt_project.yml` to bring in only the rows that return these values in the fields specified.

```yml
vars:
    bkpf_mandt_var: 'value1' # Applicable to the `sap__0fi_gl_14` model
    kna1_mandt_var: 'value2' # Applicable to the `sap__0customer_attr` model
    lfa1_mandt_var: 'value3' # Applicable to the `sap__0vendor_attr` model
    mara_mandt_var: 'value4' # Applicable to the `sap__0material_attr` model
    ska1_mandt_var: 'value5' # Applicable to the `sap__0gl_account_attr` model
    t001_mandt_var: 'value6' # Applicable to the `sap__0comp_code_attr` model
    faglflexa_rldnr_var: 'value7' # Applicable to the `sap__0fi_gl_14` model
    faglflext_rbukrs_var: 'value8' # Applicable to the `sap__0fi_gl_10` model
    faglflext_rclnt_var: 'value9' # Applicable to the `sap__0fi_gl_10` model
    faglflext_rldnr_var: 'value10' # Applicable to the `sap__0fi_gl_10` model
    faglflext_ryear_var: 'value11' # Applicable to the `sap__0fi_gl_10` model
``` 
### Passing Through Additional Fields

### Change the build schema
By default, this package builds the SAP staging models within a schema titled (`<target_schema>` + `_sap_source`) in your destination. If this is not where you would like your sap staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    sap:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_sap_source/blob/main/dbt_project.yml) variable declarations to see the expected names.

```yml
vars:
    sap_<default_source_table_name>_identifier: your_table_name 
```
  
</details>

## (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>
    

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/sap_source
      version: [">=0.1.0", "<0.2.0"]

    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.3.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```

# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/sap/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_sap/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_sap/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Submit any questions you have about our packages [in our Fivetran dbt community](https://community.fivetran.com/t5/user-group-for-dbt/gh-p/dbt-user-group) so our Engineering team can provide guidance as quickly as possible!