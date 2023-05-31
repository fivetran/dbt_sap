
# dbt_sap v0.1.0  
🎉 This is the initial release of this package! 🎉

## 📣 What does this dbt package do?
- Produces modeled tables that leverage SAP data from [Fivetran's connector](https://fivetran.com/docs/applications/sap) and build off the output of our [SAP source package](https://github.com/fivetran/dbt_sap_source). 
- Enables you to better understand your SAP data. The package achieves this by performing the following: 
    - Brings in essential tables like G/L Account Number attribute (`sap__0gl_account_attr`) and Master Material data (`sap__0material_attr`).
    - Adds general ledger models like General Ledger: Balances, Leading Ledger (`sap__0fi_gl_10`) and Line Items Leading Ledger (`sap__0fi_gl_14`).
- Generates a comprehensive data dictionary of your source and modeled sap data through the [dbt docs site](https://fivetran.github.io/dbt_sap/).
 
For more information, refer to the [README](https://github.com/fivetran/dbt_sap/blob/main/README.md).