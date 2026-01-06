{{ config(enabled=var('sap_using_prps', True)) }}

select *
from {{ var('prps') }}