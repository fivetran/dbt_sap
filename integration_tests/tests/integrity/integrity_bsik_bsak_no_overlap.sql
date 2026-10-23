{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false) and var('sap_using_bseg', True) and var('sap_using_bkpf', True) and var('sap_using_bsak_bck', True)
) }}

-- A vendor line item is either open (bsik) or cleared (bsak), never both.
with bsik as (
    select
        mandt,
        bukrs,
        gjahr,
        belnr,
        buzei
    from {{ ref('bsik') }}
),

bsak as (
    select
        mandt,
        bukrs,
        gjahr,
        belnr,
        buzei
    from {{ ref('bsak') }}
)

select
    bsik.mandt,
    bsik.bukrs,
    bsik.gjahr,
    bsik.belnr,
    bsik.buzei
from bsik
inner join bsak
    on bsik.mandt = bsak.mandt
    and bsik.bukrs = bsak.bukrs
    and bsik.gjahr = bsak.gjahr
    and bsik.belnr = bsak.belnr
    and bsik.buzei = bsak.buzei
