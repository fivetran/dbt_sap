{{ config(enabled=var('sap_using_coep', True)) }}

select *
from {{ var('coep') }}