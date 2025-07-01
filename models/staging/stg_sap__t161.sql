{{ config(enabled=var('sap_using_t161', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__t161_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__t161_tmp')),
                staging_columns=get_t161_columns()
            )
        }}
    from base
),

final as (
    select
        abgebot,
        abvor,
        ar_object,
        brefn,
        bsakz,
        bsart,
        bstyp,
        cp_aktive,
        cptype,
        fls_rsto,
        fsh_dpr_detpro,
        fsh_excl_return,
        fsh_po_idoc,
        fsh_var_kalsm,
        fsh_vas_act,
        fsh_vas_del,
        fsh_vas_detdt,
        fsh_vas_kalsm,
        gsfrg,
        hityp,
        hvr_change_time,
        hvr_is_deleted,
        koako,
        koett,
        kornr,
        kzale,
        lphis,
        mandt,
        mill_omkz,
        msr_active,
        numka,
        numkc,
        numke,
        numki,
        oicsegi,
        oirfqreq,
        pargr,
        pincr,
        refba,
        rdp_profile,
        shenq,
        stafo,
        stako,
        tolsl,
        umlif,
        upinc,
        variante,
        wrf_enable_dateline,
        wvvkz,
        xlokz,
        _sapmp_atnam,
        _sapmp_ceact,
        _sapmp_gauf,
        _sapmp_pdact,
        _sapmp_pprot,
        _sapmp_puser,
        _sapmp_pausw
    from fields
)

select *
from final
