{{ config(enabled=var('sap_using_t006', True)) }}

select * from {{ var('t006') }}