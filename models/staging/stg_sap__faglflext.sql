{{ config(enabled=var('sap_using_faglflext', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__faglflext_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__faglflext_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_faglflext_columns()
            )
        }}
    from base
),

final as (

    select
        cast(rclnt as {{ dbt.type_string() }}) as rclnt,
        ryear,
        objnr00,
        objnr01,
        objnr02,
        objnr03,
        objnr04,
        objnr05,
        objnr06,
        objnr07,
        objnr08,
        drcrk,
        rpmax,
        activ,
        rmvct,
        rtcur,
        runit,
        awtyp,
        cast(rldnr as {{ dbt.type_string() }}) as rldnr,
        rrcty,
        rvers,
        logsys,
        racct,
        cost_elem, 
        cast(rbukrs as {{ dbt.type_string() }}) as rbukrs,
        rcntr,
        prctr,
        rfarea,
        rbusa,
        kokrs,
        segment,
        zzspreg,
        scntr,
        pprctr,
        sfarea,
        sbusa,
        rassc,
        psegment,
        hslvt,
        hsl01,
        hsl02,
        hsl03,
        hsl04,
        hsl05,
        hsl06,
        hsl07,
        hsl08,
        hsl09,
        hsl10,
        hsl11,
        hsl12,
        hsl13,
        hsl14,
        hsl15,
        hsl16,
        tslvt,
        tsl01,
        tsl02,
        tsl03,
        tsl04,
        tsl05,
        tsl06,
        tsl07,
        tsl08,
        tsl09,
        tsl10,
        tsl11,
        tsl12,
        tsl13,
        tsl14,
        tsl15,
        tsl16,
        kslvt,
        ksl01,
        ksl02,
        ksl03,
        ksl04,
        ksl05,
        ksl06,
        ksl07,
        ksl08,
        ksl09,
        ksl10,
        ksl11,
        ksl12,
        ksl13,
        ksl14,
        ksl15,
        ksl16,
        oslvt,
        osl01,
        osl02,
        osl03,
        osl04,
        osl05,
        osl06,
        osl07,
        osl08,
        osl09,
        osl10,
        osl11,
        osl12,
        osl13,
        osl14,
        osl15,
        osl16,
        faglflext_timestamp,
        _fivetran_rowid,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select * 
from final