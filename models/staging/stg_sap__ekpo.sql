{{ config(enabled=var('sap_using_ekpo', True)) }}

select *
from {{ ref('stg_sap__ekpo_tmp') }}
