{{ config(enabled=var('sap_using_finsc_ledger_rep', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__finsc_ledger_rep_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__finsc_ledger_rep_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_finsc_ledger_rep_columns()
            )
        }}
    from base
),

final as (
    select
        cast(rldnr as {{ dbt.type_string() }}) as rldnr,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(rldnr_pers as {{ dbt.type_string() }}) as rldnr_pers
    from fields
)

select *
from final
