{{ config(enabled=var('sap_using_vbup', True)) }}

select *
from {{ var('vbup') }}
