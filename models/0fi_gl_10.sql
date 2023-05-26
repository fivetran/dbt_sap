with unpivot as ( 

	select * 
	from {{ ref('int_sap__0fi_gl_10_unpivot') }}
),

t001 as (

    select *
    from {{ var('t001') }}
),

-- sum_joined as (

--     select
--         faglflext.drcrk,
--         faglflext.objnr00,
--         faglflext.objnr01,
--         faglflext.objnr02,
--         faglflext.objnr03,
--         faglflext.objnr04,
--         faglflext.objnr05,
--         faglflext.objnr06,
--         faglflext.objnr07,
--         faglflext.objnr08,
--         faglflext.rclnt,
--         faglflext.rpmax,
--         faglflext.ryear,
--         faglflext.activ,
--         faglflext.rmvct,
--         faglflext.rtcur,
--         faglflext.runit,
--         faglflext.awtyp,
--         faglflext.rldnr,
--         faglflext.rrcty,
--         faglflext.rvers,
--         faglflext.logsys,
--         faglflext.racct,
--         faglflext.cost_elem,
--         faglflext.rbukrs,
--         faglflext.rcntr,
--         faglflext.prctr,
--         faglflext.rfarea,
--         faglflext.rbusa,
--         faglflext.kokrs,
--         faglflext.segment,
--         faglflext.zzspreg,
--         faglflext.scntr,
--         faglflext.pprctr,
--         faglflext.sfarea,
--         faglflext.sbusa,
--         faglflext.rassc,
--         faglflext.psegment,
--         t001.waers,
--         t001.periv,
--         t001.ktopl,
--         faglflext.hslvt,
--         faglflext.hslvt AS hsmvt,
--         faglflext.hsl01,
--         {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01, 'numeric', 23,2) }} AS hsm01,
-- faglflext.hsl02,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02, 'numeric', 23,2) }} AS hsm02,
-- faglflext.hsl03,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03, 'numeric', 23,2) }} AS hsm03,
-- faglflext.hsl04,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04, 'numeric', 23,2) }} AS hsm04,
-- faglflext.hsl05,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05, 'numeric', 23,2) }} AS hsm05,
-- faglflext.hsl06,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06, 'numeric', 23,2) }} AS hsm06,
-- faglflext.hsl07,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07, 'numeric', 23,2) }} AS hsm07,
-- faglflext.hsl08,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08, 'numeric', 23,2) }} AS hsm08,
-- faglflext.hsl09,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09, 'numeric', 23,2) }} AS hsm09,
-- faglflext.hsl10,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10, 'numeric', 23,2) }} AS hsm10,
-- faglflext.hsl11,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11, 'numeric', 23,2) }} AS hsm11,
-- faglflext.hsl12,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12, 'numeric', 23,2) }} AS hsm12,
-- faglflext.hsl13,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13, 'numeric', 23,2) }} AS hsm13,
-- faglflext.hsl14,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14, 'numeric', 23,2) }} AS hsm14,
-- faglflext.hsl15,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15, 'numeric', 23,2) }} AS hsm15,
-- faglflext.hsl16,
-- {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15+faglflext.hsl16, 'numeric', 23,2) }} AS hsm16,
--     faglflext.tslvt,
--     faglflext.tslvt AS tsmvt,
--     faglflext.tsl01,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01, 'numeric', 23,2) }} AS tsm01,
-- faglflext.tsl02,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02, 'numeric', 23,2) }} AS tsm02,
-- faglflext.tsl03,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03, 'numeric', 23,2) }} AS tsm03,
-- faglflext.tsl04,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04, 'numeric', 23,2) }} AS tsm04,
-- faglflext.tsl05,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05, 'numeric', 23,2) }} AS tsm05,
-- faglflext.tsl06,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06, 'numeric', 23,2) }} AS tsm06,
-- faglflext.tsl07,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07, 'numeric', 23,2) }} AS tsm07,
-- faglflext.tsl08,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08, 'numeric', 23,2) }} AS tsm08,
-- faglflext.tsl09,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09, 'numeric', 23,2) }} AS tsm09,
-- faglflext.tsl10,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10, 'numeric', 23,2) }} AS tsm10,
-- faglflext.tsl11,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11, 'numeric', 23,2) }} AS tsm11,
-- faglflext.tsl12,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12, 'numeric', 23,2) }} AS tsm12,
-- faglflext.tsl13,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13, 'numeric', 23,2) }} AS tsm13,
-- faglflext.tsl14,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14, 'numeric', 23,2) }} AS tsm14,
-- faglflext.tsl15,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15, 'numeric', 23,2) }} AS tsm15,
-- faglflext.tsl16,
-- {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15+faglflext.tsl16, 'numeric', 23,2) }} AS tsm16,
-- faglflext.kslvt,
-- faglflext.kslvt AS ksmvt,
-- faglflext.ksl01,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01, 'numeric', 23,2) }} AS ksm01,
-- faglflext.ksl02,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02, 'numeric', 23,2) }} AS ksm02,
-- faglflext.ksl03,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03, 'numeric', 23,2) }} AS ksm03,
-- faglflext.ksl04,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04, 'numeric', 23,2) }} AS ksm04,
-- faglflext.ksl05,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05, 'numeric', 23,2) }} AS ksm05,
-- faglflext.ksl06,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06, 'numeric', 23,2) }} AS ksm06,
-- faglflext.ksl07,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07, 'numeric', 23,2) }} AS ksm07,
-- faglflext.ksl08,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08, 'numeric', 23,2) }} AS ksm08,
-- faglflext.ksl09,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09, 'numeric', 23,2) }} AS ksm09,
-- faglflext.ksl10,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10, 'numeric', 23,2) }} AS ksm10,
-- faglflext.ksl11,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11, 'numeric', 23,2) }} AS ksm11,
-- faglflext.ksl12,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12, 'numeric', 23,2) }} AS ksm12,
-- faglflext.ksl13,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13, 'numeric', 23,2) }} AS ksm13,
-- faglflext.ksl14,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14, 'numeric', 23,2) }} AS ksm14,
-- faglflext.ksl15,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15, 'numeric', 23,2) }} AS ksm15,
-- faglflext.ksl16,
-- {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15+faglflext.ksl16, 'numeric', 23,2) }} AS ksm16,
-- faglflext.oslvt,
-- faglflext.oslvt AS osmvt,
-- faglflext.osl01,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01, 'numeric', 23,2) }} AS osm01,
-- faglflext.osl02,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02, 'numeric', 23,2) }} AS osm02,
-- faglflext.osl03,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03, 'numeric', 23,2) }} AS osm03,
-- faglflext.osl04,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04, 'numeric', 23,2) }} AS osm04,
-- faglflext.osl05,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05, 'numeric', 23,2) }} AS osm05,
-- faglflext.osl06,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06, 'numeric', 23,2) }} AS osm06,
-- faglflext.osl07,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07, 'numeric', 23,2) }} AS osm07,
-- faglflext.osl08,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08, 'numeric', 23,2) }} AS osm08,
-- faglflext.osl09,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09, 'numeric', 23,2) }} AS osm09,
-- faglflext.osl10,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10, 'numeric', 23,2) }} AS osm10,
-- faglflext.osl11,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11, 'numeric', 23,2) }} AS osm11,
-- faglflext.osl12,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12, 'numeric', 23,2) }} AS osm12,
-- faglflext.osl13,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13, 'numeric', 23,2) }} AS osm13,
-- faglflext.osl14,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14, 'numeric', 23,2) }} AS osm14,
-- faglflext.osl15,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14+faglflext.osl15, 'numeric', 23,2) }} AS osm15,
-- faglflext.osl16,
-- {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14+faglflext.osl15+faglflext.osl16, 'numeric', 23,2) }} AS osm16,
-- faglflext."TIMESTAMP",
-- faglflext."_FIVETRAN_ROWID",
-- faglflext."_FIVETRAN_DELETED",
-- faglflext."_FIVETRAN_SYNCED"
-- FROM faglflext 
-- INNER JOIN too1 ON
-- faglflext.RBUKRS = too1.BUKRS
-- AND faglflext.RCLNT = too1.MANDT
-- WHERE
-- rclnt = '800'
-- AND ryear = '2007'
-- AND rbukrs = '2400' 
-- AND rldnr = '0L' 




SELECT
RYEAR
, ACTIV
, RMVCT
, RTCUR
, RUNIT
, AWTYP
, RLDNR
, RRCTY
, RVERS
, LOGSYS
, RACCT
, COST_ELEM
, RBUKRS
, RCNTR
, PRCTR
, RFAREA
, RBUSA
, KOKRS
, SEGMENT
, SCNTR
, PPRCTR
, SFAREA
, SBUSA
, RASSC
, PSEGMENT
, TIMESTAMP
, currency_type
, fiscal_period
, sum(Debit_Amount) AS Debit_Amount
, sum(Credit_Amount) as Credit_Amount
, sum(Accumulated_Balance) AS Accumulated_Balance
,sum(turnover) AS turnover
FROM
(
SELECT
RYEAR
, ACTIV
, RMVCT
, RTCUR
, RUNIT
, AWTYP
, RLDNR
, RRCTY
, RVERS
, LOGSYS
, RACCT
, COST_ELEM
, RBUKRS
, RCNTR
, PRCTR
, RFAREA
, RBUSA
, KOKRS
, SEGMENT
, SCNTR
, PPRCTR
, SFAREA
, SBUSA
, RASSC
, PSEGMENT
, TIMESTAMP
, CASE LEFT (fieldtype,1) WHEN 'T' THEN '00' WHEN 'H' THEN '10' WHEN 'K' then '20' WHEN 'O' THEN '40' end AS currency_type
, 0 || CASE WHEN RIGHT(fieldtype,2) = 'vt' THEN '00' ELSE RIGHT(fieldtype,2) END ||'.' || RYEAR AS fiscal_period
, CASE WHEN DRCRK = 'S' and substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Debit_Amount,
CASE WHEN DRCRK = 'H' and substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Credit_Amount,
CASE WHEN substring (fieldtype,3,1) = 'M' THEN value ELSE 0 END AS Accumulated_Balance,
CASE WHEN substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Turnover


FROM
(
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
    faglflext.hslvt AS hsmvt,
    faglflext.hsl01,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01, 'numeric', 23,2) }} AS hsm01,
    faglflext.hsl02,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02, 'numeric', 23,2) }} AS hsm02,
    faglflext.hsl03,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03, 'numeric', 23,2) }} AS hsm03,
    faglflext.hsl04,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04, 'numeric', 23,2) }} AS hsm04,
    faglflext.hsl05,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05, 'numeric', 23,2) }} AS hsm05,
    faglflext.hsl06,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06, 'numeric', 23,2) }} AS hsm06,
    faglflext.hsl07,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07, 'numeric', 23,2) }} AS hsm07,
    faglflext.hsl08,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08, 'numeric', 23,2) }} AS hsm08,
    faglflext.hsl09,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09, 'numeric', 23,2) }} AS hsm09,
    faglflext.hsl10,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10, 'numeric', 23,2) }} AS hsm10,
    faglflext.hsl11,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11, 'numeric', 23,2) }} AS hsm11,
    faglflext.hsl12,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12, 'numeric', 23,2) }} AS hsm12,
    faglflext.hsl13,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13, 'numeric', 23,2) }} AS hsm13,
    faglflext.hsl14,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14, 'numeric', 23,2) }} AS hsm14,
    faglflext.hsl15,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15, 'numeric', 23,2) }} AS hsm15,
    faglflext.hsl16,
    {{ dbt_utils.safe_cast(faglflext.hslvt+faglflext.hsl01+faglflext.hsl02+faglflext.hsl03+faglflext.hsl04+faglflext.hsl05+faglflext.hsl06+faglflext.hsl07+faglflext.hsl08+faglflext.hsl09+faglflext.hsl10+faglflext.hsl11+faglflext.hsl12+faglflext.hsl13+faglflext.hsl14+faglflext.hsl15+faglflext.hsl16, 'numeric', 23,2) }} AS hsm16,
    faglflext.tslvt,
    faglflext.tslvt AS tsmvt,
    faglflext.tsl01,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01, 'numeric', 23,2) }} AS tsm01,
    faglflext.tsl02,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02, 'numeric', 23,2) }} AS tsm02,
    faglflext.tsl03,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03, 'numeric', 23,2) }} AS tsm03,
    faglflext.tsl04,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04, 'numeric', 23,2) }} AS tsm04,
    faglflext.tsl05,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05, 'numeric', 23,2) }} AS tsm05,
    faglflext.tsl06,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06, 'numeric', 23,2) }} AS tsm06,
    faglflext.tsl07,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07, 'numeric', 23,2) }} AS tsm07,
    faglflext.tsl08,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08, 'numeric', 23,2) }} AS tsm08,
    faglflext.tsl09,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09, 'numeric', 23,2) }} AS tsm09,
    faglflext.tsl10,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10, 'numeric', 23,2) }} AS tsm10,
    faglflext.tsl11,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11, 'numeric', 23,2) }} AS tsm11,
    faglflext.tsl12,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12, 'numeric', 23,2) }} AS tsm12,
    faglflext.tsl13,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13, 'numeric', 23,2) }} AS tsm13,
    faglflext.tsl14,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14, 'numeric', 23,2) }} AS tsm14,
    faglflext.tsl15,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15, 'numeric', 23,2) }} AS tsm15,
    faglflext.tsl16,
    {{ dbt_utils.safe_cast(faglflext.tslvt+faglflext.tsl01+faglflext.tsl02+faglflext.tsl03+faglflext.tsl04+faglflext.tsl05+faglflext.tsl06+faglflext.tsl07+faglflext.tsl08+faglflext.tsl09+faglflext.tsl10+faglflext.tsl11+faglflext.tsl12+faglflext.tsl13+faglflext.tsl14+faglflext.tsl15+faglflext.tsl16, 'numeric', 23,2) }} AS tsm16,
    faglflext.kslvt,
    faglflext.kslvt AS ksmvt,
    faglflext.ksl01,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01, 'numeric', 23,2) }} AS ksm01,
    faglflext.ksl02,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02, 'numeric', 23,2) }} AS ksm02,
    faglflext.ksl03,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03, 'numeric', 23,2) }} AS ksm03,
    faglflext.ksl04,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04, 'numeric', 23,2) }} AS ksm04,
    faglflext.ksl05,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05, 'numeric', 23,2) }} AS ksm05,
    faglflext.ksl06,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06, 'numeric', 23,2) }} AS ksm06,
    faglflext.ksl07,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07, 'numeric', 23,2) }} AS ksm07,
    faglflext.ksl08,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08, 'numeric', 23,2) }} AS ksm08,
    faglflext.ksl09,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09, 'numeric', 23,2) }} AS ksm09,
    faglflext.ksl10,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10, 'numeric', 23,2) }} AS ksm10,
    faglflext.ksl11,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11, 'numeric', 23,2) }} AS ksm11,
    faglflext.ksl12,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12, 'numeric', 23,2) }} AS ksm12,
    faglflext.ksl13,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13, 'numeric', 23,2) }} AS ksm13,
    faglflext.ksl14,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14, 'numeric', 23,2) }} AS ksm14,
    faglflext.ksl15,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15, 'numeric', 23,2) }} AS ksm15,
    faglflext.ksl16,
    {{ dbt_utils.safe_cast(faglflext.kslvt+faglflext.ksl01+faglflext.ksl02+faglflext.ksl03+faglflext.ksl04+faglflext.ksl05+faglflext.ksl06+faglflext.ksl07+faglflext.ksl08+faglflext.ksl09+faglflext.ksl10+faglflext.ksl11+faglflext.ksl12+faglflext.ksl13+faglflext.ksl14+faglflext.ksl15+faglflext.ksl16, 'numeric', 23,2) }} AS ksm16,
    faglflext.oslvt,
    faglflext.oslvt AS osmvt,
    faglflext.osl01,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01, 'numeric', 23,2) }} AS osm01,
    faglflext.osl02,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02, 'numeric', 23,2) }} AS osm02,
    faglflext.osl03,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03, 'numeric', 23,2) }} AS osm03,
    faglflext.osl04,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04, 'numeric', 23,2) }} AS osm04,
    faglflext.osl05,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05, 'numeric', 23,2) }} AS osm05,
    faglflext.osl06,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06, 'numeric', 23,2) }} AS osm06,
    faglflext.osl07,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07, 'numeric', 23,2) }} AS osm07,
    faglflext.osl08,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08, 'numeric', 23,2) }} AS osm08,
    faglflext.osl09,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09, 'numeric', 23,2) }} AS osm09,
    faglflext.osl10,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10, 'numeric', 23,2) }} AS osm10,
    faglflext.osl11,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11, 'numeric', 23,2) }} AS osm11,
    faglflext.osl12,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12, 'numeric', 23,2) }} AS osm12,
    faglflext.osl13,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13, 'numeric', 23,2) }} AS osm13,
    faglflext.osl14,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14, 'numeric', 23,2) }} AS osm14,
    faglflext.osl15,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14+faglflext.osl15, 'numeric', 23,2) }} AS osm15,
    faglflext.osl16,
    {{ dbt_utils.safe_cast(faglflext.oslvt+faglflext.osl01+faglflext.osl02+faglflext.osl03+faglflext.osl04+faglflext.osl05+faglflext.osl06+faglflext.osl07+faglflext.osl08+faglflext.osl09+faglflext.osl10+faglflext.osl11+faglflext.osl12+faglflext.osl13+faglflext.osl14+faglflext.osl15+faglflext.osl16, 'numeric', 23,2) }} AS osm16,
    faglflext.timestamp,
    faglflext._fivetran_rowid,
    faglflext._fivetran_deleted,
    faglflext._fivetran_synced
    from faglflext 
    inner join t001 
        on faglflext.rbukrs = t001.bukrs
        and faglflext.rclnt = t001.mandt
    where rclnt = '800'
        and ryear = '2007'
        and rbukrs = '2400'
        --AND RACCT = '0000792000'
        and rldnr = '0L'
        --AND PRCTR = '0000001500'
    ) SEL1
    
    
unpivot (value FOR fieldtype IN (
hslvt,
hsmvt,
hsl01,
hsm01,
hsl02,
hsm02,
hsl03,
hsm03,
hsl04,
hsm04,
hsl05,
hsm05,
hsl06,
hsm06,
hsl07,
hsm07,
hsl08,
hsm08,
hsl09,
hsm09,
hsl10,
hsm10,
hsl11,
hsm11,
hsl12,
hsm12,
hsl13,
hsm13,
hsl14,
hsm14,
hsl15,
hsm15,
hsl16,
hsm16,
tslvt,
tsmvt,
tsl01,
tsm01,
tsl02,
tsm02,
tsl03,
tsm03,
tsl04,
tsm04,
tsl05,
tsm05,
tsl06,
tsm06,
tsl07,
tsm07,
tsl08,
tsm08,
tsl09,
tsm09,
tsl10,
tsm10,
tsl11,
tsm11,
tsl12,
tsm12,
tsl13,
tsm13,
tsl14,
tsm14,
tsl15,
tsm15,
tsl16,
tsm16,
kslvt,
ksmvt,
ksl01,
ksm01,
ksl02,
ksm02,
ksl03,
ksm03,
ksl04,
ksm04,
ksl05,
ksm05,
ksl06,
ksm06,
ksl07,
ksm07,
ksl08,
ksm08,
ksl09,
ksm09,
ksl10,
ksm10,
ksl11,
ksm11,
ksl12,
ksm12,
ksl13,
ksm13,
ksl14,
ksm14,
ksl15,
ksm15,
ksl16,
ksm16,
oslvt,
osmvt,
osl01,
osm01,
osl02,
osm02,
osl03,
osm03,
osl04,
osm04,
osl05,
osm05,
osl06,
osm06,
osl07,
osm07,
osl08,
osm08,
osl09,
osm09,
osl10,
osm10,
osl11,
osm11,
osl12,
osm12,
osl13,
osm13,
osl14,
osm14,
osl15,
osm15,
osl16,
osm16
))
)
GROUP BY
RYEAR
, ACTIV
, RMVCT
, RTCUR
, RUNIT
, AWTYP
, RLDNR
, RRCTY
, RVERS
, LOGSYS
, RACCT
, COST_ELEM
, RBUKRS
, RCNTR
, PRCTR
, RFAREA
, RBUSA
, KOKRS
, SEGMENT
, SCNTR
, PPRCTR
, SFAREA
, SBUSA
, RASSC
, PSEGMENT
, TIMESTAMP
, currency_type
, fiscal_period