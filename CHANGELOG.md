
# dbt_sap v0.1.0  
🎉 This is the initial release of this package! 🎉

## 📣 What does this dbt package do?
- Produces modeled tables that leverage SAP data from [Fivetran's connector](https://fivetran.com/docs/databases/sap-erp/sap-erp-hana) and build off the output of our [SAP source package](https://github.com/fivetran/dbt_sap_source). 
- Enables you to better understand your SAP data. The package achieves this by performing the following: 
    - Brings in essential master attribute tables like Company Code (`sap__0comp_code_attr`), Customer Master (`sap__0customer_attr`), Employee (`sap__0employee_attr`), G/L Account Number (`sap__0gl_account_attr`), Material Data (`sap__0material_attr`), and Vendor Number (`sap__0vendor_attr`).
    - Brings in general ledger models like General Ledger: Balances, Leading Ledger (`sap__0fi_gl_10`) and Line Items Leading Ledger (`sap__0fi_gl_14`).
    - Brings in master text models like Company Code (`sap__0comp_code_text`), Company (`sap__0company_text`), and Vendor (`sap__0vendor_text`).
- Generates a comprehensive data dictionary of your source and modeled sap data through the [dbt docs site](https://fivetran.github.io/dbt_sap/).
 
For more information, refer to the [README](https://github.com/fivetran/dbt_sap/blob/main/README.md).