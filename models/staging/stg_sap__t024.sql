{{ config(enabled=var('sap_using_t024', True)) }}

select *
from {{ ref('stg_sap__t024_tmp') }}
