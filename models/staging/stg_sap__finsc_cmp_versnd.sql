{{ config(enabled=var('sap_using_finsc_cmp_versnd', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__finsc_cmp_versnd_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__finsc_cmp_versnd_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_finsc_cmp_versnd_columns()
            )
        }}
    from base
),

final as (
    select
        mandt,
        bukrs,
        rldnr,
        versn,
        field_name_buzei,
        field_name_wtgbtr_add,
        field_name_wtgbtr_subtract,
        set_to_zero,
        field_name_wogbtr_add,
        field_name_wogbtr_subtract,
        field_name_wkgbtr_add,
        field_name_wkgbtr_subtract,
        field_name_wkfbtr_add,
        field_name_wkfbtr_subtract,
        field_name_pagbtr_add,
        field_name_pagbtr_subtract,
        field_name_pafbtr_add,
        field_name_pafbtr_subtract,
        _fivetran_sap_archived,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select *
from final
