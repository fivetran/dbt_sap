{{ config(enabled=var('sap_using_mchb', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__mchb_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__mchb_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_mchb_columns()
            )
        }}
    from base
),

final as (
    select
        _cwm_ceinm,
        _cwm_cinsm,
        _cwm_clabs,
        _cwm_cretm,
        _cwm_cspem,
        _cwm_cumlm,
        _cwm_cvmei,
        _cwm_cvmin,
        _cwm_cvmla,
        _cwm_cvmre,
        _cwm_cvmsp,
        _cwm_cvmum,
        _fivetran_deleted,
        _fivetran_sap_archived,
        _fivetran_synced,
        aenam,
        ceinm,
        cast(charg as {{ dbt.type_string() }}) as charg,
        chdll,
        chjin,
        chrue,
        cinsm,
        clabs,
        cretm,
        cspem,
        cumlm,
        cvmei,
        cvmin,
        cvmla,
        cvmre,
        cvmsp,
        cvmum,
        ernam,
        ersda,
        fsh_collection,
        fsh_salloc_qty,
        fsh_season,
        fsh_season_year,
        fsh_theme,
        herkl,
        kzice,
        kzicl,
        kzicq,
        kzics,
        kzvce,
        kzvcl,
        kzvcq,
        kzvcs,
        laeda,
        cast(lfgja as {{ dbt.type_string() }}) as lfgja,
        cast(lfmon as {{ dbt.type_string() }}) as lfmon,
        cast(lgort as {{ dbt.type_string() }}) as lgort,
        lvorm,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(matnr as {{ dbt.type_string() }}) as matnr,
        sgt_scat,
        sperc,
        cast(werks as {{ dbt.type_string() }}) as werks
    from fields
)

select *
from final
