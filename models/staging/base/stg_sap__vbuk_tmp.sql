{{ config(enabled=var('sap_using_vbuk', True)) }}

select *
from {{ var('vbuk') }}
