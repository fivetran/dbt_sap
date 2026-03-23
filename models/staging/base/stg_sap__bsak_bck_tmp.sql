{{ config(enabled=var('sap_using_bsak_bck', True)) }}

select *
from {{ var('bsak_bck') }}
