{{ config(enabled=var('sap_using_vbak', True)) }}

select *
from {{ ref('stg_sap__vbak_tmp') }}