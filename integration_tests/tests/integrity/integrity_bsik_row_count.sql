{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false) and var('sap_using_bseg', True) and var('sap_using_bkpf', True)
) }}

-- bsik should hold exactly the open vendor line items in BSEG.
-- A mismatch means the filter drifted or the BKPF join fanned out.
with source as (
    select count(*) as source_row_count
    from {{ ref('stg_sap__bseg') }}
    where koart = 'K'
        and augbl = ''
        and not (h_bstat = 'D')
        and not (h_bstat = 'M')
),

model as (
    select count(*) as model_row_count
    from {{ ref('bsik') }}
)

select
    source.source_row_count,
    model.model_row_count
from source
cross join model
where source.source_row_count != model.model_row_count
