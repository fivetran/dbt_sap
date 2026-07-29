{{ config(enabled=var('sap_using_faat_plan_values', True)) }}

select *
from {{ var('faat_plan_values') }}
