{{ config(enabled=var('sap_using_t001', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t001_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t001_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t001_columns()
            )
        }}
    from base
),

final as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        dkweg,
        xgjrv,
        xeink,
        fdbuk,
        pp_pdate,
        xprod,
        xskfn,
        xcovr,
        ebukr,
        bukrs_glob,
        xmwsn,
        butxt,
        bapovar,
        xbbko,
        dttdsp,
        dtaxr,
        impda,
        kkber,
        xfmca,
        xfmcb,
        surccm,
        fstvare,
        periv,
        txjcd,
        fmhrdate,
        xbbba,
        ort01,
        rcomp,
        xsplt,
        kopim,
        infmt,
        fm_derive_acc,
        ktopl,
        umkrs,
        xkkbi,
        pst_per_var,
        xvatdate,
        txkrs,
        waers,
        xkdft,
        xcos,
        xbbbf,
        xbbsc,
        xfmco,
        dttaxc,
        mregl,
        mwskv,
        xstdt,
        xnegp,
        spras,
        xvvwa,
        dtprov,
        waabw,
        wt_newwt,
        xcession,
        xslta,
        adrnr,
        xjvaa,
        opvar,
        mwska,
        kokfi,
        ktop2,
        xextb,
        buvar,
        offsacct,
        dtamtc,
        wfvar,
        land1,
        fstva,
        xfdis,
        xbbbe,
        xvalv,
        fikrs,
        xfdsd,
        xfdmm,
        xgsbe,
        stceg,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_sap_archived
    from fields
)

select * 
from final