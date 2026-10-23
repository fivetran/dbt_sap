{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false) and var('sap_using_bseg', True) and var('sap_using_bkpf', True)
) }}

-- Each BSEG line item should appear in bsik at most once.
select
    mandt,
    bukrs,
    gjahr,
    belnr,
    buzei,
    count(*) as row_count
from {{ ref('bsik') }}
group by
    mandt,
    bukrs,
    gjahr,
    belnr,
    buzei
having count(*) > 1
