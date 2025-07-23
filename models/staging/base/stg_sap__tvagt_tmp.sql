{{ config(enabled=var('sap_using_tvagt', True)) }}

select * 
from {{ var('tvagt') }}