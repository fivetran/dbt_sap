with faglflext as ( 

	select * 
	from {{ var('faglflext') }}
),

t001 as (

    select *
    from {{ var('t001') }}
),

final as (

    select
        faglflext.drcrk,
        faglflext.objnr00,
        faglflext.objnr01,
        faglflext.objnr02,
        faglflext.objnr03,
        faglflext.objnr04,
        faglflext.objnr05,
        faglflext.objnr06,
        faglflext.objnr07,
        faglflext.objnr08,
        faglflext.rclnt,
        faglflext.rpmax,
        faglflext.ryear,
        faglflext.activ,
        faglflext.rmvct,
        faglflext.rtcur,
        faglflext.runit,
        faglflext.awtyp,
        faglflext.rldnr,
        faglflext.rrcty,
        faglflext.rvers,
        faglflext.logsys,
        faglflext.racct,
        faglflext.cost_elem,
        faglflext.rbukrs,
        faglflext.rcntr,
        faglflext.prctr,
        faglflext.rfarea,
        faglflext.rbusa,
        faglflext.kokrs,
        faglflext.segment,
        faglflext.zzspreg,
        faglflext.scntr,
        faglflext.pprctr,
        faglflext.sfarea,
        faglflext.sbusa,
        faglflext.rassc,
        faglflext.psegment,
        t001.waers,
        t001.periv,
        t001.ktopl,
        faglflext.hslvt,
        faglflext.hslvt as hsmvt,

        faglflext.hsl01,
        cast(faglflext.hslvt+faglflext.hsl01 as {{ dbt.type_numeric() }}) as hsm01,
        faglflext.hsl02,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02 as {{ dbt.type_numeric() }} as hsm02,
        faglflext.hsl03,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03 as {{ dbt.type_numeric() }}) as hsm03,
        faglflext.hsl04,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04 as {{ dbt.type_numeric() }}) as hsm04,
        faglflext.hsl05,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05 as {{ dbt.type_numeric() }}) as hsm05,
        faglflext.hsl06,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06 as {{ dbt.type_numeric() }}) as hsm06,
        faglflext.hsl07,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07 as {{ dbt.type_numeric() }}) as hsm07,
        faglflext.hsl08,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08 as {{ dbt.type_numeric() }}) as hsm08,
        faglflext.hsl09,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09 as {{ dbt.type_numeric() }}) as hsm09,
        faglflext.hsl10,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10 as {{ dbt.type_numeric() }}) as hsm10,
        faglflext.hsl11,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11 as {{ dbt.type_numeric() }}) as hsm11,
        faglflext.hsl12,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12 as {{ dbt.type_numeric() }}) as hsm12,
        faglflext.hsl13,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13 as {{ dbt.type_numeric() }}) as hsm13,
        faglflext.hsl14,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14 as {{ dbt.type_numeric() }}) as hsm14,
        faglflext.hsl15,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15 as {{ dbt.type_numeric() }}) as hsm15,
        faglflext.hsl16,
        cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15+faglflext.hsl16 as {{ dbt.type_numeric() }}) as hsm16, 

        faglflext.tslvt,
        faglflext.tslvt AS tsmvt,

        faglflext.tsl01,
        cast(faglflext.tslvt+faglflext.tsl01 as {{ dbt.type_numeric() }}) as tsm01,

        faglflext.tsl02,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02 as {{ dbt.type_numeric() }}) as tsm02,

        faglflext.tsl03,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03 as {{ dbt.type_numeric() }}) as tsm03,

        faglflext.tsl04,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04 as {{ dbt.type_numeric() }}) as tsm04,

        faglflext.tsl05,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05 as {{ dbt.type_numeric() }}) as tsm05,

        faglflext.tsl06,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06 as {{ dbt.type_numeric() }}) as tsm06,

        faglflext.tsl07,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07 as {{ dbt.type_numeric() }}) as tsm07,

        faglflext.tsl08,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08 as {{ dbt.type_numeric() }}) as tsm08,

        faglflext.tsl09,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09 as {{ dbt.type_numeric() }}) as tsm09,

        faglflext.tsl10,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10 as {{ dbt.type_numeric() }}) as tsm10,

        faglflext.tsl11,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11 as {{ dbt.type_numeric() }}) as tsm11,

        faglflext.tsl12,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12 as {{ dbt.type_numeric() }}) as tsm12,

        faglflext.tsl13,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13 as {{ dbt.type_numeric() }}) as tsm13,

        faglflext.tsl14,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14 as {{ dbt.type_numeric() }}) as tsm14,

        faglflext.tsl15,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15 as {{ dbt.type_numeric() }}) as tsm15,

        faglflext.tsl16,
        cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15+faglflext.tsl16 as {{ dbt.type_numeric() }}) as tsm16,

        faglflext.kslvt,
        faglflext.kslvt AS ksmvt,

        faglflext.ksl01,
        cast(faglflext.kslvt+faglflext.ksl01 as {{ dbt.type_numeric() }}) as ksm01,

        faglflext.ksl02,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02 as {{ dbt.type_numeric() }}) as ksm02,

        faglflext.ksl03,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03 as {{ dbt.type_numeric() }}) as ksm03,

        faglflext.ksl04,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04 as {{ dbt.type_numeric() }}) as ksm04,

        faglflext.ksl05,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05 as {{ dbt.type_numeric() }}) as ksm05,

        faglflext.ksl06,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06 as {{ dbt.type_numeric() }}) as ksm06,

        faglflext.ksl07,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07 as {{ dbt.type_numeric() }}) as ksm07,

        faglflext.ksl08,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08 as {{ dbt.type_numeric() }}) as ksm08,

        faglflext.ksl09,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09 as {{ dbt.type_numeric() }}) as ksm09,

        faglflext.ksl10,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10 as {{ dbt.type_numeric() }}) as ksm10,

        faglflext.ksl11,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11 as {{ dbt.type_numeric() }}) as ksm11,

        faglflext.ksl12,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12 as {{ dbt.type_numeric() }}) as ksm12,

        faglflext.ksl13,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13 as {{ dbt.type_numeric() }}) as ksm13,

        faglflext.ksl14,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14 as {{ dbt.type_numeric() }}) as ksm14,

        faglflext.ksl15,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15 as {{ dbt.type_numeric() }}) as ksm15,

        faglflext.ksl16,
        cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15+faglflext.ksl16 as {{ dbt.type_numeric() }}) as ksm16,

        faglflext.oslvt,
        faglflext.oslvt AS osmvt, 

        faglflext.osl01,
        cast(faglflext.oslvt+faglflext.osl01 as {{ dbt.type_numeric() }}) as osm01,


        faglflext.osl02,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02 as {{ dbt.type_numeric() }}) as osm02,

        faglflext.osl03,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03 as {{ dbt.type_numeric() }}) as osm03,


        faglflext.osl04,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04 as {{ dbt.type_numeric() }}) as osm04,

        faglflext.osl05,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05 as {{ dbt.type_numeric() }}) as osm05,

        faglflext.osl06,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06 as {{ dbt.type_numeric() }}) as osm06,

        faglflext.osl07,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07 as {{ dbt.type_numeric() }}) as osm07,

        faglflext.osl08,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08 as {{ dbt.type_numeric() }}) as osm08,

        faglflext.osl09,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09 as {{ dbt.type_numeric() }}) as osm09,

        faglflext.osl10,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10 as {{ dbt.type_numeric() }}) as osm10,

        faglflext.osl11,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11 as {{ dbt.type_numeric() }}) as osm11,

        faglflext.osl12,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11+faglfext.osl12 as {{ dbt.type_numeric() }}) as osm12,

        faglflext.osl13,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11+faglfext.osl12+faglfext.osl13 as {{ dbt.type_numeric() }}) as osm13,

        faglflext.osl14,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11+faglfext.osl12+faglfext.osl13+faglfext.osl14 as {{ dbt.type_numeric() }}) as osm14,

        faglflext.osl15,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11+faglfext.osl12+faglfext.osl13+faglfext.osl14+faglfext.osl15 as {{ dbt.type_numeric() }}) as osm15,

        faglflext.osl16,
        cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglfext.osl09+faglfext.osl10+faglfext.osl11+faglfext.osl12+faglfext.osl13+faglfext.osl14+faglfext.osl15+faglfext.osl16 as {{ dbt.type_numeric() }}) as osm16,

        faglflext.faglflext_timestamp,
        faglflext._fivetran_rowid,
        faglflext._fivetran_deleted,
        faglflext._fivetran_synced
    from faglflext 
    inner join t001 
        on faglflext.rbukrs = t001.bukrs
        and faglflext.rclnt = t001.mandt
    where faglflext.rclnt =  {{ var('faglflext_rclnt_var') }}
        and faglflext.ryear = {{ var('faglflext_ryear_var') }}
        and faglflext.rbukrs = {{ var('faglflext_rbukrs_var') }}
        and faglflext.racct = {{ var('faglflext_racct_var') }}
        and faglflext.rldnr =  {{ var('faglflext_rldnr_var') }}
        and faglflext.prctr = {{ var('faglflext_prctr_var') }} 
)

select *
from final