{{ config(enabled=var('sap_using_dd07t', True)) }}

select *
from {{ ref('stg_sap__dd07t_tmp') }}
