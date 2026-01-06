{{ config(enabled=var('sap_using_cosp_bak', True)) }}

select * from {{ var('cosp_bak') }}