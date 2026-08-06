{{ config(enabled=var('sap_using_faat_plan_values', True)) }}

-- Compatibility view reconstructing the classic SAP ANLP (Asset Periodic Values)
-- table from FAAT_PLAN_VALUES in S/4HANA. ANLA is joined to supply the account
-- determination group (KTOGR) which is not stored in FAAT_PLAN_VALUES.

with stg_sap__faat_plan_values as (
    select *
    from {{ ref('stg_sap__faat_plan_values') }}
),

{% if var('sap_using_anla', True) %}
stg_sap__anla as (
    select *
    from {{ ref('stg_sap__anla') }}
),
{% endif %}

final as (
    select
        fp.mandt,
        fp.bukrs,
        fp.gjahr,
        fp.peraf,
        fp.afbnr,
        fp.anln1,
        fp.anln2,
        fp.afaber,
        fp.zujhr,
        fp.zucod,
        fp.aufwp,
        fp.aufwb,
        fp.aufwz,
        fp.nafap,
        fp.nafag,
        fp.nafaz,
        fp.safap,
        fp.safag,
        fp.safaz,
        fp.aafap,
        fp.aafag,
        fp.aafaz,
        fp.mafap,
        fp.mafag,
        fp.mafaz,
        fp.zinsp,
        fp.zinsg,
        fp.zinsz,
        fp.aufnp,
        fp.aufng,
        fp.aufnz,
        fp.answl,
        fp.invzm,
        {% if var('sap_using_anla', True) %}
        anla.ktogr,
        {% else %}
        cast('' as {{ dbt.type_string() }})      as ktogr,
        {% endif %}
        fp.afasl,
        fp.kostl,
        fp.gsber,
        fp.caufn,
        fp.xunul,
        fp.anupd,
        fp.fkber,
        fp.belnr,
        fp.lstar,
        fp.geber,
        fp.grant_nbr,
        fp.geber2,
        fp.fkber2,
        fp.grant_nbr2,
        fp.fistl2,
        fp.imkey,
        fp.ps_psp_pnr2,
        fp.budget_pd,
        fp.budget_pd2,
        fp.segment,
        fp.prctr,
        fp.fistl
    from stg_sap__faat_plan_values as fp
    {% if var('sap_using_anla', True) %}
    left join stg_sap__anla as anla
        on (anla.mandt = fp.mandt
            and anla.bukrs = fp.bukrs
            and anla.anln1 = fp.anln1
            and anla.anln2 = fp.anln2)
    {% endif %}
)

select *
from final
