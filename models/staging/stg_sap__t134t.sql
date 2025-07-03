{{ config(enabled=var('sap_using_t134t', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t134t_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t134t_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t134t_columns()
            )
        }}
    from base
),

final as (
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        mtart,
        mtbez,
        spras
    from fields
)

select *
from final
