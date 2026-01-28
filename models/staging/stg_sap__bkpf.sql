{{ config(enabled=var('sap_using_bkpf', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__bkpf_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__bkpf_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_bkpf_columns()
            )
        }}
    from base
),

final as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(bukrs_sender as {{ dbt.type_string() }}) as bukrs_sender,
        cast(belnr as {{ dbt.type_string() }}) as belnr,
        cast(belnr_sender as {{ dbt.type_string() }}) as belnr_sender,
        cast(gjahr as {{ dbt.type_string() }}) as gjahr,
        cast(gjahr_sender as {{ dbt.type_string() }}) as gjahr_sender,
        blart,
        cast(bldat as {{ dbt.type_string() }}) as bldat,
        cast(budat as {{ dbt.type_string() }}) as budat,
        cast(monat as {{ dbt.type_string() }}) as monat,
        cast(cpudt as {{ dbt.type_string() }}) as cpudt,
        propmano,
        cast(xblnr as {{ dbt.type_string() }}) as xblnr,
        lotkz,
        cast(waers as {{ dbt.type_string() }}) as waers,
        glvor,
        awkey,
        awtyp,
        logsystem_sender,
        fikrs,
        hwaer,
        hwae2,
        hwae3,
        awsys,
        ldgrp,
        kursf,
        xnetb,
        xstov,
        xreorg
    from fields
)

select * 
from final