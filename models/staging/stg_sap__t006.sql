{{ config(enabled=var('sap_using_t006', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t006_tmp')) %}

with base as (

    select 
        {{ remove_slashes_from_col_names(source_columns,reserved_word_list=["primary"]) }}
    from {{ ref('stg_sap__t006_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t006_columns()
            )
        }}
    from base
),

final as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(msehi as {{ dbt.type_string() }}) as msehi,
        cast(temp_unit as {{ dbt.type_string() }}) as temp_unit,
        temp_value,
        nennr,
        cast(kzex3 as {{ dbt.type_string() }}) as kzex3,
        cast(is_primary as {{ dbt.type_string() }}) as is_primary, --aliased in the get_t006_columns macro.
        decan,
        cast(press_unit as {{ dbt.type_string() }}) as press_unit,
        cast(kzkeh as {{ dbt.type_string() }}) as kzkeh,
        exp10,
        zaehl,
        cast(kz2eh as {{ dbt.type_string() }}) as kz2eh,
        cast(famunit as {{ dbt.type_string() }}) as famunit,
        press_val,
        andec,
        cast(kz1eh as {{ dbt.type_string() }}) as kz1eh,
        addko,
        cast(isocode as {{ dbt.type_string() }}) as isocode,
        cast(kzex6 as {{ dbt.type_string() }}) as kzex6,
        expon,
        cast(dimid as {{ dbt.type_string() }}) as dimid,
        cast(kzwob as {{ dbt.type_string() }}) as kzwob,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_sap_archived

    from fields

)

select * from final