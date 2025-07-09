{{ config(enabled=var('sap_using_t161', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t161_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t161_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
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
        cast(mandt as {{ dbt.type_string() }}) as mandt,
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
        _sapmp_pausw,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_rowid
    from fields
)

select *
from final
