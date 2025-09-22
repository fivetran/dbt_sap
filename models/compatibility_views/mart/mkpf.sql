{{ config(enabled=var('sap_using_matdoc', True)) }}

with stg_sap__matdoc as (
  select *
  from {{ ref('stg_sap__matdoc') }}
)

select *
from stg_sap__matdoc
where (record_type = 'MDOC'and header_counter = 1)