{{ config(enabled=var('sap_using_bsad_bck', True)) }}

select *
from {{ var('bsad_bck') }}