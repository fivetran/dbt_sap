{{ config(enabled=var('sap_using_vbap', True)) }}

select *
from {{ var('vbap') }}
