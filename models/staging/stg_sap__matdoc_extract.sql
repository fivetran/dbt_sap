{{ config(enabled=var('sap_using_matdoc_extract', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__matdoc_extract_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__matdoc_extract_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_matdoc_extract_columns()
            )
        }}
    from base
),

final as (
    select
        _cwm_consumption_qty,
        _cwm_meins,
        _cwm_meins_sid,
        _cwm_stock_qty_l1,
        _cwm_stock_qty_l2,
        _fivetran_deleted,
        _fivetran_sap_archived,
        _fivetran_synced,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(charg_sid as {{ dbt.type_string() }}) as charg_sid,
        consumption_qty,
        cpudt_l1,
        cpudt_l2,
        disub_owner_sid,
        gjper,
        gjper_curr_per,
        kunnr_sid,
        kzbws,
        cast(lbbsa_sid as {{ dbt.type_string() }}) as lbbsa_sid,
        cast(lgort_sid as {{ dbt.type_string() }}) as lgort_sid,
        lifnr_sid,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        mat_kdauf,
        mat_kdpos,
        mat_pspnr,
        cast(matbf as {{ dbt.type_string() }}) as matbf,
        meins,
        periv,
        record_type,
        resourcename_sid,
        cast(sobkz as {{ dbt.type_string() }}) as sobkz,
        cast(stock_ind_l2 as {{ dbt.type_string() }}) as stock_ind_l2,
        stock_qty_l1,
        stock_qty_l2,
        stock_vkwrt_l1,
        stock_vkwrt_l2,
        waers,
        cast(werks as {{ dbt.type_string() }}) as werks,
        xobew
    from fields
)

select *
from final
