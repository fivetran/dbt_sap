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
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(rldnr as {{ dbt.type_string() }}) as rldnr,
        cast(versn as {{ dbt.type_string() }}) as versn,
        cast(field_name_buzei as {{ dbt.type_string() }}) as field_name_buzei,
        cast(field_name_wtgbtr_add as {{ dbt.type_string() }}) as field_name_wtgbtr_add,
        cast(field_name_wtgbtr_subtract as {{ dbt.type_string() }}) as field_name_wtgbtr_subtract,
        cast(set_to_zero as {{ dbt.type_string() }}) as set_to_zero,
        cast(field_name_wogbtr_add as {{ dbt.type_string() }}) as field_name_wogbtr_add,
        cast(field_name_wogbtr_subtract as {{ dbt.type_string() }}) as field_name_wogbtr_subtract,
        cast(field_name_wkgbtr_add as {{ dbt.type_string() }}) as field_name_wkgbtr_add,
        cast(field_name_wkgbtr_subtract as {{ dbt.type_string() }}) as field_name_wkgbtr_subtract,
        cast(field_name_wkfbtr_add as {{ dbt.type_string() }}) as field_name_wkfbtr_add,
        cast(field_name_wkfbtr_subtract as {{ dbt.type_string() }}) as field_name_wkfbtr_subtract,
        cast(field_name_pagbtr_add as {{ dbt.type_string() }}) as field_name_pagbtr_add,
        cast(field_name_pagbtr_subtract as {{ dbt.type_string() }}) as field_name_pagbtr_subtract,
        cast(field_name_refbz as {{ dbt.type_string() }}) as field_name_refbz,
        cast(field_name_pafbtr_add as {{ dbt.type_string() }}) as field_name_pafbtr_add,
        cast(field_name_pafbtr_subtract as {{ dbt.type_string() }}) as field_name_pafbtr_subtract,
        _fivetran_sap_archived,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select *
from final
