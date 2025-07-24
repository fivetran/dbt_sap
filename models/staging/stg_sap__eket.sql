{{ config(enabled=var('sap_using_eket', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__eket_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__eket_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_eket_columns()
            )
        }}
    from base
),

final as (
    select
        abart,
        altdt,
        ameng,
        anzsn,
        aulwe,
        banfn,
        bedat,
        bnfpo,
        budg_type,
        cd_locno,
        cd_loctype,
        charg,
        check_type,
        chkom,
        cncl_ancmnt_done,
        dabmg,
        dat01,
        dateshift_number,
        dl_id,
        dng_date,
        dng_time,
        cast(ebeln as {{ dbt.type_string() }}) as ebeln,
        cast(ebelp as {{ dbt.type_string() }}) as ebelp,
        eindt,
        eldat,
        eluhr,
        estkz,
        etenr,
        fixkz,
        fsh_os_id,
        fsh_ralloc_qty,
        fsh_salloc_qty,
        geo_route,
        glmng,
        gts_ind,
        handover_date,
        handoverdate,
        handovertime,
        hvr_change_time,
        hvr_is_deleted,
        key_id,
        lddat,
        lduhr,
        licha,
        lpein,
        mahnz,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        mbdat,
        mbuhr,
        cast(menge as {{ dbt.type_numeric() }}) as menge,
        mng02,
        no_scem,
        nodisp,
        otb_curr,
        otb_reason,
        otb_res_value,
        otb_spec_value,
        otb_status,
        otb_value,
        qunum,
        qupos,
        route_gts,
        rsnum,
        sernr,
        slfdt,
        spr_rsn_profile,
        tddat,
        tduhr,
        tsp,
        uzeit,
        verid,
        wadat,
        wamng,
        wauhr,
        wemng,
        _fivetran_sap_archived,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select *
from final
