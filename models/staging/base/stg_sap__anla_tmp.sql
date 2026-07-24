{{ config(enabled=var('sap_using_anla', True)) }}

select *
from {{ var('anla') }}
