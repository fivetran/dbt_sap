{{ config(enabled=var('sap_using_vbuk', True)) }}

select *
from {{ ref('stg_sap__vbuk_tmp') }}
