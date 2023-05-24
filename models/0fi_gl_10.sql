with faglflext as ( 

	select * 
	from {{ var('faglflext') }}
),

t001 as (

    select *
    from {{ var('t001') }}
),

sum_joined as (

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
        t001.WAERS,
        t001.PERIV,
        t001.KTOPL,
        faglflext.hslvt,
        faglflext.hslvt AS hsmvt,
        faglflext.hsl01,
        CAST (faglflext.HSLVT+faglflext.HSL01 AS number (23,2)) AS HSM01,
faglflext.HSL02,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02 AS number (23,2)) AS HSM02,
faglflext.HSL03,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03 AS number (23,2)) AS HSM03,
faglflext.HSL04,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04 AS number (23,2)) AS HSM04,
faglflext.HSL05,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05 AS number (23,2)) AS HSM05,
faglflext.HSL06,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06 AS number (23,2)) AS HSM06,
faglflext.HSL07,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07 AS number (23,2)) AS HSM07,
faglflext.HSL08,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08 AS number (23,2)) AS HSM08,
faglflext.HSL09,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09 AS number (23,2)) AS HSM09,
faglflext.HSL10,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10 AS number (23,2)) AS HSM10,
faglflext.HSL11,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11 AS number (23,2)) AS HSM11,
faglflext.HSL12,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12 AS number (23,2)) AS HSM12,
faglflext.HSL13,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13 AS number (23,2)) AS HSM13,
faglflext.HSL14,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14 AS number (23,2)) AS HSM14,
faglflext.HSL15,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14+faglflext.HSL15 AS number (23,2)) AS HSM15,
faglflext.HSL16,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14+faglflext.HSL15+faglflext.HSL16 AS number (23,2)) AS HSM16,
    faglflext.tslvt,
    faglflext.tslvt AS tsmvt,
    faglflext.tsl01,
CAST (faglflext.TSLVT+faglflext.TSL01 AS number (23,2)) AS TSM01,
faglflext.TSL02,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02 AS number (23,2)) AS TSM02,
faglflext.TSL03,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03 AS number (23,2)) AS TSM03,
faglflext.TSL04,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04 AS number (23,2)) AS TSM04,
faglflext.TSL05,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05 AS number (23,2)) AS TSM05,
faglflext.TSL06,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06 AS number (23,2)) AS TSM06,
faglflext.TSL07,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07 AS number (23,2)) AS TSM07,
faglflext.TSL08,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08 AS number (23,2)) AS TSM08,
faglflext.TSL09,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09 AS number (23,2)) AS TSM09,
faglflext.TSL10,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10 AS number (23,2)) AS TSM10,
faglflext.TSL11,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11 AS number (23,2)) AS TSM11,
faglflext.TSL12,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12 AS number (23,2)) AS TSM12,
faglflext.TSL13,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13 AS number (23,2)) AS TSM13,
faglflext.TSL14,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14 AS number (23,2)) AS TSM14,
faglflext.TSL15,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14+faglflext.TSL15 AS number (23,2)) AS TSM15,
faglflext.TSL16,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14+faglflext.TSL15+faglflext.TSL16 AS number (23,2)) AS TSM16,
faglflext.KSLVT,
faglflext.KSLVT AS KSMVT,
faglflext.KSL01,
CAST (faglflext.KSLVT+faglflext.KSL01 AS number (23,2)) AS KSM01,
faglflext.KSL02,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02 AS number (23,2)) AS KSM02,
faglflext.KSL03,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03 AS number (23,2)) AS KSM03,
faglflext.KSL04,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04 AS number (23,2)) AS KSM04,
faglflext.KSL05,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05 AS number (23,2)) AS KSM05,
faglflext.KSL06,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06 AS number (23,2)) AS KSM06,
faglflext.KSL07,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07 AS number (23,2)) AS KSM07,
faglflext.KSL08,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08 AS number (23,2)) AS KSM08,
faglflext.KSL09,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09 AS number (23,2)) AS KSM09,
faglflext.KSL10,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10 AS number (23,2)) AS KSM10,
faglflext.KSL11,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11 AS number (23,2)) AS KSM11,
faglflext.KSL12,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12 AS number (23,2)) AS KSM12,
faglflext.KSL13,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13 AS number (23,2)) AS KSM13,
faglflext.KSL14,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14 AS number (23,2)) AS KSM14,
faglflext.KSL15,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14+faglflext.KSL15 AS number (23,2)) AS KSM15,
faglflext.KSL16,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14+faglflext.KSL15+faglflext.KSL16 AS number (23,2)) AS KSM16,
faglflext.OSLVT,
faglflext.OSLVT AS OSMVT,
faglflext.OSL01,
CAST (faglflext.OSLVT+faglflext.OSL01 AS number (23,2)) AS OSM01,
faglflext.OSL02,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02 AS number (23,2)) AS OSM02,
faglflext.OSL03,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03 AS number (23,2)) AS OSM03,
faglflext.OSL04,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04 AS number (23,2)) AS OSM04,
faglflext.OSL05,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05 AS number (23,2)) AS OSM05,
faglflext.OSL06,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06 AS number (23,2)) AS OSM06,
faglflext.OSL07,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07 AS number (23,2)) AS OSM07,
faglflext.OSL08,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08 AS number (23,2)) AS OSM08,
faglflext.OSL09,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09 AS number (23,2)) AS OSM09,
faglflext.OSL10,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10 AS number (23,2)) AS OSM10,
faglflext.OSL11,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11 AS number (23,2)) AS OSM11,
faglflext.OSL12,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12 AS number (23,2)) AS OSM12,
faglflext.OSL13,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13 AS number (23,2)) AS OSM13,
faglflext.OSL14,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14 AS number (23,2)) AS OSM14,
faglflext.OSL15,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14+faglflext.OSL15 AS number (23,2)) AS OSM15,
faglflext.OSL16,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14+faglflext.OSL15+faglflext.OSL16 AS number (23,2)) AS OSM16,
faglflext."TIMESTAMP",
faglflext."_FIVETRAN_ROWID",
faglflext."_FIVETRAN_DELETED",
faglflext."_FIVETRAN_SYNCED"
FROM faglflext 
INNER JOIN too1 ON
faglflext.RBUKRS = too1.BUKRS
AND faglflext.RCLNT = too1.MANDT
WHERE
rclnt = '800'
AND ryear = '2007'
AND rbukrs = '2400' 
AND rldnr = '0L' 




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
, 0 || CASE WHEN RIGHT(fieldtype,2) = 'VT' THEN '00' ELSE RIGHT(fieldtype,2) END ||'.' || RYEAR AS fiscal_period
, CASE WHEN DRCRK = 'S' and substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Debit_Amount,
CASE WHEN DRCRK = 'H' and substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Credit_Amount,
CASE WHEN substring (fieldtype,3,1) = 'M' THEN value ELSE 0 END AS Accumulated_Balance,
CASE WHEN substring (fieldtype,3,1) = 'L' THEN value ELSE 0 END AS Turnover


FROM
(
SELECT
faglflext.DRCRK,
faglflext.OBJNR00,
faglflext.OBJNR01,
faglflext.OBJNR02,
faglflext.OBJNR03,
faglflext.OBJNR04,
faglflext.OBJNR05,
faglflext.OBJNR06,
faglflext.OBJNR07,
faglflext.OBJNR08,
faglflext.RCLNT,
faglflext.RPMAX,
faglflext.RYEAR,
faglflext.ACTIV,
faglflext.RMVCT,
faglflext.RTCUR,
faglflext.RUNIT,
faglflext.AWTYP,
faglflext.RLDNR,
faglflext.RRCTY,
faglflext.RVERS,
faglflext.LOGSYS,
faglflext.RACCT,
faglflext.COST_ELEM,
faglflext.RBUKRS,
faglflext.RCNTR,
faglflext.PRCTR,
faglflext.RFAREA,
faglflext.RBUSA,
faglflext.KOKRS,
faglflext.SEGMENT,
faglflext.ZZSPREG,
faglflext.SCNTR,
faglflext.PPRCTR,
faglflext.SFAREA,
faglflext.SBUSA,
faglflext.RASSC,
faglflext.PSEGMENT,
T2.WAERS ,
T2.PERIV ,
T2.KTOPL ,
faglflext.HSLVT,
faglflext.HSLVT AS HSMVT,
faglflext.HSL01,
CAST (faglflext.HSLVT+faglflext.HSL01 AS number (23,2)) AS HSM01,
faglflext.HSL02,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02 AS number (23,2)) AS HSM02,
faglflext.HSL03,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03 AS number (23,2)) AS HSM03,
faglflext.HSL04,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04 AS number (23,2)) AS HSM04,
faglflext.HSL05,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05 AS number (23,2)) AS HSM05,
faglflext.HSL06,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06 AS number (23,2)) AS HSM06,
faglflext.HSL07,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07 AS number (23,2)) AS HSM07,
faglflext.HSL08,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08 AS number (23,2)) AS HSM08,
faglflext.HSL09,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09 AS number (23,2)) AS HSM09,
faglflext.HSL10,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10 AS number (23,2)) AS HSM10,
faglflext.HSL11,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11 AS number (23,2)) AS HSM11,
faglflext.HSL12,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12 AS number (23,2)) AS HSM12,
faglflext.HSL13,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13 AS number (23,2)) AS HSM13,
faglflext.HSL14,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14 AS number (23,2)) AS HSM14,
faglflext.HSL15,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14+faglflext.HSL15 AS number (23,2)) AS HSM15,
faglflext.HSL16,
CAST (faglflext.HSLVT+faglflext.HSL01+faglflext.HSL02+faglflext.HSL03+faglflext.HSL04+faglflext.HSL05+faglflext.HSL06+faglflext.HSL07+faglflext.HSL08+faglflext.HSL09+faglflext.HSL10+faglflext.HSL11+faglflext.HSL12+faglflext.HSL13+faglflext.HSL14+faglflext.HSL15+faglflext.HSL16 AS number (23,2)) AS HSM16,
faglflext.TSLVT,
faglflext.TSLVT AS TSMVT,
faglflext.TSL01,
CAST (faglflext.TSLVT+faglflext.TSL01 AS number (23,2)) AS TSM01,
faglflext.TSL02,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02 AS number (23,2)) AS TSM02,
faglflext.TSL03,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03 AS number (23,2)) AS TSM03,
faglflext.TSL04,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04 AS number (23,2)) AS TSM04,
faglflext.TSL05,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05 AS number (23,2)) AS TSM05,
faglflext.TSL06,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06 AS number (23,2)) AS TSM06,
faglflext.TSL07,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07 AS number (23,2)) AS TSM07,
faglflext.TSL08,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08 AS number (23,2)) AS TSM08,
faglflext.TSL09,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09 AS number (23,2)) AS TSM09,
faglflext.TSL10,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10 AS number (23,2)) AS TSM10,
faglflext.TSL11,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11 AS number (23,2)) AS TSM11,
faglflext.TSL12,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12 AS number (23,2)) AS TSM12,
faglflext.TSL13,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13 AS number (23,2)) AS TSM13,
faglflext.TSL14,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14 AS number (23,2)) AS TSM14,
faglflext.TSL15,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14+faglflext.TSL15 AS number (23,2)) AS TSM15,
faglflext.TSL16,
CAST (faglflext.TSLVT+faglflext.TSL01+faglflext.TSL02+faglflext.TSL03+faglflext.TSL04+faglflext.TSL05+faglflext.TSL06+faglflext.TSL07+faglflext.TSL08+faglflext.TSL09+faglflext.TSL10+faglflext.TSL11+faglflext.TSL12+faglflext.TSL13+faglflext.TSL14+faglflext.TSL15+faglflext.TSL16 AS number (23,2)) AS TSM16,
faglflext.KSLVT,
faglflext.KSLVT AS KSMVT,
faglflext.KSL01,
CAST (faglflext.KSLVT+faglflext.KSL01 AS number (23,2)) AS KSM01,
faglflext.KSL02,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02 AS number (23,2)) AS KSM02,
faglflext.KSL03,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03 AS number (23,2)) AS KSM03,
faglflext.KSL04,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04 AS number (23,2)) AS KSM04,
faglflext.KSL05,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05 AS number (23,2)) AS KSM05,
faglflext.KSL06,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06 AS number (23,2)) AS KSM06,
faglflext.KSL07,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07 AS number (23,2)) AS KSM07,
faglflext.KSL08,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08 AS number (23,2)) AS KSM08,
faglflext.KSL09,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09 AS number (23,2)) AS KSM09,
faglflext.KSL10,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10 AS number (23,2)) AS KSM10,
faglflext.KSL11,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11 AS number (23,2)) AS KSM11,
faglflext.KSL12,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12 AS number (23,2)) AS KSM12,
faglflext.KSL13,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13 AS number (23,2)) AS KSM13,
faglflext.KSL14,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14 AS number (23,2)) AS KSM14,
faglflext.KSL15,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14+faglflext.KSL15 AS number (23,2)) AS KSM15,
faglflext.KSL16,
CAST (faglflext.KSLVT+faglflext.KSL01+faglflext.KSL02+faglflext.KSL03+faglflext.KSL04+faglflext.KSL05+faglflext.KSL06+faglflext.KSL07+faglflext.KSL08+faglflext.KSL09+faglflext.KSL10+faglflext.KSL11+faglflext.KSL12+faglflext.KSL13+faglflext.KSL14+faglflext.KSL15+faglflext.KSL16 AS number (23,2)) AS KSM16,
faglflext.OSLVT,
faglflext.OSLVT AS OSMVT,
faglflext.OSL01,
CAST (faglflext.OSLVT+faglflext.OSL01 AS number (23,2)) AS OSM01,
faglflext.OSL02,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02 AS number (23,2)) AS OSM02,
faglflext.OSL03,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03 AS number (23,2)) AS OSM03,
faglflext.OSL04,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04 AS number (23,2)) AS OSM04,
faglflext.OSL05,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05 AS number (23,2)) AS OSM05,
faglflext.OSL06,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06 AS number (23,2)) AS OSM06,
faglflext.OSL07,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07 AS number (23,2)) AS OSM07,
faglflext.OSL08,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08 AS number (23,2)) AS OSM08,
faglflext.OSL09,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09 AS number (23,2)) AS OSM09,
faglflext.OSL10,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10 AS number (23,2)) AS OSM10,
faglflext.OSL11,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11 AS number (23,2)) AS OSM11,
faglflext.OSL12,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12 AS number (23,2)) AS OSM12,
faglflext.OSL13,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13 AS number (23,2)) AS OSM13,
faglflext.OSL14,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14 AS number (23,2)) AS OSM14,
faglflext.OSL15,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14+faglflext.OSL15 AS number (23,2)) AS OSM15,
faglflext.OSL16,
CAST (faglflext.OSLVT+faglflext.OSL01+faglflext.OSL02+faglflext.OSL03+faglflext.OSL04+faglflext.OSL05+faglflext.OSL06+faglflext.OSL07+faglflext.OSL08+faglflext.OSL09+faglflext.OSL10+faglflext.OSL11+faglflext.OSL12+faglflext.OSL13+faglflext.OSL14+faglflext.OSL15+faglflext.OSL16 AS number (23,2)) AS OSM16,
faglflext."TIMESTAMP",
faglflext."_FIVETRAN_ROWID",
faglflext."_FIVETRAN_DELETED",
faglflext."_FIVETRAN_SYNCED"
FROM
EC_DB.HVA_SAPECC_HANA2_SAPABAP1.FAGLFLEXT T1
INNER JOIN EC_DB.HVA_SAPECC_HANA2_SAPABAP1.t001 T2 ON
faglflext.RBUKRS = T2.BUKRS
AND faglflext.RCLNT = T2.MANDT
WHERE
RCLNT = '800'
AND RYEAR = '2007'
AND RBUKRS = '2400'
--AND RACCT = '0000792000'
AND RLDNR = '0L'
--AND PRCTR = '0000001500'
) SEL1
unpivot (value FOR fieldtype IN (
HSLVT,
HSMVT,
HSL01,
HSM01,
HSL02,
HSM02,
HSL03,
HSM03,
HSL04,
HSM04,
HSL05,
HSM05,
HSL06,
HSM06,
HSL07,
HSM07,
HSL08,
HSM08,
HSL09,
HSM09,
HSL10,
HSM10,
HSL11,
HSM11,
HSL12,
HSM12,
HSL13,
HSM13,
HSL14,
HSM14,
HSL15,
HSM15,
HSL16,
HSM16,
TSLVT,
TSMVT,
TSL01,
TSM01,
TSL02,
TSM02,
TSL03,
TSM03,
TSL04,
TSM04,
TSL05,
TSM05,
TSL06,
TSM06,
TSL07,
TSM07,
TSL08,
TSM08,
TSL09,
TSM09,
TSL10,
TSM10,
TSL11,
TSM11,
TSL12,
TSM12,
TSL13,
TSM13,
TSL14,
TSM14,
TSL15,
TSM15,
TSL16,
TSM16,
KSLVT,
KSMVT,
KSL01,
KSM01,
KSL02,
KSM02,
KSL03,
KSM03,
KSL04,
KSM04,
KSL05,
KSM05,
KSL06,
KSM06,
KSL07,
KSM07,
KSL08,
KSM08,
KSL09,
KSM09,
KSL10,
KSM10,
KSL11,
KSM11,
KSL12,
KSM12,
KSL13,
KSM13,
KSL14,
KSM14,
KSL15,
KSM15,
KSL16,
KSM16,
OSLVT,
OSMVT,
OSL01,
OSM01,
OSL02,
OSM02,
OSL03,
OSM03,
OSL04,
OSM04,
OSL05,
OSM05,
OSL06,
OSM06,
OSL07,
OSM07,
OSL08,
OSM08,
OSL09,
OSM09,
OSL10,
OSM10,
OSL11,
OSM11,
OSL12,
OSM12,
OSL13,
OSM13,
OSL14,
OSM14,
OSL15,
OSM15,
OSL16,
OSM16
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