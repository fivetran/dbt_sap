{{ config(enabled=var('sap_using_vbak', True)) }}

select *
from {{ var('vbak') }}