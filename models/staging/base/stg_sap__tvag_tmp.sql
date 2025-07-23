{{ config(enabled=var('sap_using_tvag', True)) }}

select * 
from {{ var('tvag') }}