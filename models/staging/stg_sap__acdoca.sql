{{ config(enabled=var('sap_using_acdoca', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__acdoca_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__acdoca_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_acdoca_columns()
            )
        }}
    from base
),

final as (
    select
        rclnt,
        objnr,
        ryear,
        accasty,
        racct,
        hrkft,
        vrgng,
        parobsrc,
        parob1,
        paccasty,
        uspob,
        co_beknz,
        rwcur,
        co_buzei,
        co_buzei1,
        co_buzei2,
        co_buzei5,
        co_buzei6,
        co_buzei7,
        rldnr,
        poper,
        co_meinh,
        wsl,
        wsl2,
        wsl3,
        co_osl,
        hsl,
        osl,
        vsl,
        bsl,
        csl,
        dsl,
        esl,
        fsl,
        gsl,
        ksl,
        kfsl,
        kfsl2,
        kfsl3,
        psl,
        psl2,
        psl3,
        pfsl,
        pfsl2,
        pfsl3,
        co_megbtr,
        co_mefbtr,
        msl,
        mfsl,
        muvflg,
        beltp,
        rbukrs,
        rfarea,
        segment,
        rfund,
        rgrant_nbr,
        rbudget_pd,
        mig_source,
        bstat,
        timestamp,
        kokrs,
        logsyso,
        hvr_change_time,
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced
        from
        fields
)

select *
from final
