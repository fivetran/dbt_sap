{{ config(enabled=var('sap_using_vbup', True)) }}

select *
from {{ ref('stg_sap__vbup_tmp') }}
