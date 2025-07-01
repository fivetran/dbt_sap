{{ config(enabled=var('sap_using_vbap', True)) }}

select *
from {{ ref('stg_sap__vbap_tmp') }}
