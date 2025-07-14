{{ config(enabled=var('sap_using_t161t', True)) }}

select *
from {{ var('t161t') }}
