{{ config(enabled=var('sap_using_t024', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t024_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t024_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t024_columns()
            )
        }}
    from base
),

final as (
    select
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced,
        _fivetran_sap_archived,
        ekgrp,
        eknam,
        ektel,
        ldest,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        smtp_addr,
        tel_extens,
        tel_number,
        telfx
    from fields
)

select *
from final
