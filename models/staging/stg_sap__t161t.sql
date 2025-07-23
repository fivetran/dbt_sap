{{ config(enabled=var('sap_using_t161t', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t161t_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t161t_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t161t_columns()
            )
        }}
    from base
),

final as (
    select
        batxt,
        bsart,
        bstyp,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        spras,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_rowid
    from fields
)

select *
from final
