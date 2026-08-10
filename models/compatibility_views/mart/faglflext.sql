{{ config(enabled=var('sap_using_acdoca', True) and var('sap_using_finsc_ledger_rep', True) and var('sap_using_finsc_ld_cmp', True)) }}

with stg_sap__acdoca as (
    select * from {{ ref('stg_sap__acdoca') }}
),

stg_sap__finsc_ledger_rep as (
    select * from {{ ref('stg_sap__finsc_ledger_rep') }}
),

stg_sap__finsc_ld_cmp as (
    select * from {{ ref('stg_sap__finsc_ld_cmp') }}
),

-- Step 1 (FGLV_GLSI_ACD): Join ACDOCA with FINSC_LEDGER_REP and FINSC_LD_CMP.
-- Same joins and currency mapping logic as the faglflexa comp view.
glsi_acd as (
    select
        a.rclnt,
        a.ryear,
        lr.rldnr,
        a.rbukrs,
        (a.bttype) as activ,
        a.rmvct,
        a.rtcur,
        a.runit,
        a.awtyp,
        a.rrcty,
        '001' as rvers,
        a.awsys as logsys,
        a.racct,
        case
            when not (a.co_buzei = '000') then a.racct
            else ''
        end as cost_elem,
        a.rcntr,
        a.prctr,
        a.rfarea,
        a.rbusa,
        a.kokrs,
        a.segment,
        a.scntr,
        a.pprctr,
        a.sfarea,
        a.sbusa,
        a.rassc,
        a.psegment,
        a.fikrs,
        a.rfund,
        a.rgrant_nbr,
        a.rbudget_pd,
        a.sfund,
        a.sgrant_nbr,
        a.sbudget_pd,
        a.re_bukrs,
        a.re_account,
        a.vname,
        a.egrup,
        a.recid,
        a.tsl,
        a.hsl,
        case
            when lc.curposk = '2' then a.ksl
            when lc.curposo = '2' then a.osl
            when lc.curposv = '2' then a.vsl
            when lc.curposb = '2' then a.bsl
            when lc.curposc = '2' then a.csl
            when lc.curposd = '2' then a.dsl
            when lc.curpose = '2' then a.esl
            when lc.curposf = '2' then a.fsl
            when lc.curposg = '2' then a.gsl
            else cast(0 as {{ dbt.type_numeric() }})
        end as ksl,
        case
            when lc.curposo = '3' then a.osl
            when lc.curposk = '3' then a.ksl
            when lc.curposv = '3' then a.vsl
            when lc.curposb = '3' then a.bsl
            when lc.curposc = '3' then a.csl
            when lc.curposd = '3' then a.dsl
            when lc.curpose = '3' then a.esl
            when lc.curposf = '3' then a.fsl
            when lc.curposg = '3' then a.gsl
            else cast(0 as {{ dbt.type_numeric() }})
        end as osl,
        a.msl,
        a.drcrk,
        a.poper,
        a.timestamp_at
    from stg_sap__acdoca as a
    inner join stg_sap__finsc_ledger_rep as lr
        on lr.mandt = a.rclnt and lr.rldnr_pers = a.rldnr
    inner join stg_sap__finsc_ld_cmp as lc
        on lc.mandt = a.rclnt and lc.bukrs = a.rbukrs and lc.rldnr = lr.rldnr
    where
        (upper(a.bstat) = '' or upper(a.bstat) = 'L' or upper(a.bstat) = 'U'
        or upper(a.bstat) = 'J' or upper(a.bstat) = 'C' or upper(a.bstat) = 'T')
),

-- Step 2 (FGLV_GLTT0): Aggregate line items by all dimension columns, sum amounts per period.
gltt0 as (
    select
        rclnt,
        ryear,
        drcrk,
        poper,
        activ,
        rmvct,
        rtcur,
        runit,
        awtyp,
        rldnr,
        rrcty,
        rvers,
        logsys,
        racct,
        cost_elem,
        rbukrs,
        rcntr,
        prctr,
        rfarea,
        rbusa,
        kokrs,
        segment,
        scntr,
        pprctr,
        sfarea,
        sbusa,
        rassc,
        psegment,
        fikrs,
        rfund,
        rgrant_nbr,
        rbudget_pd,
        sfund,
        sgrant_nbr,
        sbudget_pd,
        re_bukrs,
        re_account,
        vname,
        egrup,
        recid,
        sum(tsl) as tsl,
        sum(hsl) as hsl,
        sum(ksl) as ksl,
        sum(osl) as osl,
        sum(msl) as msl,
        max(timestamp_at) as timestamp_at
    from glsi_acd
    group by
        rclnt, ryear, drcrk, poper, activ, rmvct, rtcur, runit, awtyp,
        rldnr, rrcty, rvers, logsys, racct, cost_elem, rbukrs, rcntr,
        prctr, rfarea, rbusa, kokrs, segment, scntr, pprctr, sfarea,
        sbusa, rassc, psegment, fikrs, rfund, rgrant_nbr, rbudget_pd,
        sfund, sgrant_nbr, sbudget_pd, re_bukrs, re_account, vname, egrup, recid
),

-- Step 3 (FGLV_GLTT1): Pivot period amounts into columnar format (TSLVT/TSL01-16, etc.).
-- Uses MOD(POPER, 16) to assign each period to one of 16 columnar slots.
-- POPER '000' maps to the carry-forward (VT) columns.
gltt1 as (
    select
        rclnt,
        ryear,
        cast(0 as {{ dbt.type_int() }}) as objnr00,
        cast(0 as {{ dbt.type_int() }}) as objnr01,
        cast(0 as {{ dbt.type_int() }}) as objnr02,
        cast(0 as {{ dbt.type_int() }}) as objnr03,
        cast(0 as {{ dbt.type_int() }}) as objnr04,
        cast(0 as {{ dbt.type_int() }}) as objnr05,
        cast(0 as {{ dbt.type_int() }}) as objnr06,
        cast(0 as {{ dbt.type_int() }}) as objnr07,
        cast(0 as {{ dbt.type_int() }}) as objnr08,
        drcrk,
        case poper
            when '000' then '016'
            else lpad(cast(16 * (1 + cast((cast(poper as {{ dbt.type_int() }}) - 1) / 16 as {{ dbt.type_int() }})) as {{ dbt.type_string() }}), 3, '0')
        end as rpmax,
        activ, rmvct, rtcur, runit, awtyp, rldnr, rrcty, rvers, logsys,
        racct, cost_elem, rbukrs, rcntr, prctr, rfarea, rbusa, kokrs,
        segment, scntr, pprctr, sfarea, sbusa, rassc, psegment,
        fikrs, rfund, rgrant_nbr, rbudget_pd, sfund, sgrant_nbr, sbudget_pd,
        re_bukrs, re_account, vname, egrup, recid,

        case poper when '000' then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tslvt,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 1  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl01,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 2  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl02,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 3  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl03,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 4  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl04,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 5  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl05,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 6  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl06,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 7  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl07,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 8  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl08,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 9  then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl09,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 10 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl10,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 11 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl11,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 12 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl12,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 13 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl13,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 14 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl14,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 15 then tsl else cast(0 as {{ dbt.type_numeric() }}) end as tsl15,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 0  then (case poper when '000' then cast(0 as {{ dbt.type_numeric() }}) else tsl end) else cast(0 as {{ dbt.type_numeric() }}) end as tsl16,

        case poper when '000' then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hslvt,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 1  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl01,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 2  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl02,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 3  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl03,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 4  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl04,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 5  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl05,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 6  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl06,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 7  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl07,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 8  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl08,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 9  then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl09,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 10 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl10,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 11 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl11,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 12 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl12,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 13 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl13,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 14 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl14,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 15 then hsl else cast(0 as {{ dbt.type_numeric() }}) end as hsl15,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 0  then (case poper when '000' then cast(0 as {{ dbt.type_numeric() }}) else hsl end) else cast(0 as {{ dbt.type_numeric() }}) end as hsl16,

        case poper when '000' then ksl else cast(0 as {{ dbt.type_numeric() }}) end as kslvt,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 1  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl01,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 2  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl02,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 3  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl03,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 4  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl04,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 5  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl05,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 6  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl06,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 7  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl07,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 8  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl08,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 9  then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl09,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 10 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl10,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 11 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl11,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 12 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl12,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 13 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl13,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 14 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl14,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 15 then ksl else cast(0 as {{ dbt.type_numeric() }}) end as ksl15,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 0  then (case poper when '000' then cast(0 as {{ dbt.type_numeric() }}) else ksl end) else cast(0 as {{ dbt.type_numeric() }}) end as ksl16,

        case poper when '000' then osl else cast(0 as {{ dbt.type_numeric() }}) end as oslvt,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 1  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl01,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 2  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl02,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 3  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl03,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 4  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl04,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 5  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl05,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 6  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl06,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 7  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl07,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 8  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl08,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 9  then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl09,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 10 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl10,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 11 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl11,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 12 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl12,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 13 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl13,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 14 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl14,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 15 then osl else cast(0 as {{ dbt.type_numeric() }}) end as osl15,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 0  then (case poper when '000' then cast(0 as {{ dbt.type_numeric() }}) else osl end) else cast(0 as {{ dbt.type_numeric() }}) end as osl16,

        case poper when '000' then msl else cast(0 as {{ dbt.type_numeric() }}) end as mslvt,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 1  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl01,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 2  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl02,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 3  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl03,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 4  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl04,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 5  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl05,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 6  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl06,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 7  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl07,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 8  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl08,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 9  then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl09,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 10 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl10,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 11 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl11,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 12 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl12,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 13 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl13,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 14 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl14,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 15 then msl else cast(0 as {{ dbt.type_numeric() }}) end as msl15,
        case mod(cast(poper as {{ dbt.type_int() }}), 16) when 0  then (case poper when '000' then cast(0 as {{ dbt.type_numeric() }}) else msl end) else cast(0 as {{ dbt.type_numeric() }}) end as msl16,

        timestamp_at
    from gltt0
),

-- Step 4 (FGLV_GLTT2): Aggregate the pivoted rows by all grouping dimensions including RPMAX.
gltt2 as (
    select
        rclnt, ryear,
        objnr00, objnr01, objnr02, objnr03, objnr04, objnr05, objnr06, objnr07, objnr08,
        drcrk, rpmax, activ, rmvct, rtcur, runit, awtyp, rldnr, rrcty, rvers, logsys,
        racct, cost_elem, rbukrs, rcntr, prctr, rfarea, rbusa, kokrs, segment,
        scntr, pprctr, sfarea, sbusa, rassc, psegment,
        fikrs, rfund, rgrant_nbr, rbudget_pd, sfund, sgrant_nbr, sbudget_pd,
        re_bukrs, re_account, vname, egrup, recid,
        sum(tslvt) as tslvt, sum(tsl01) as tsl01, sum(tsl02) as tsl02, sum(tsl03) as tsl03,
        sum(tsl04) as tsl04, sum(tsl05) as tsl05, sum(tsl06) as tsl06, sum(tsl07) as tsl07,
        sum(tsl08) as tsl08, sum(tsl09) as tsl09, sum(tsl10) as tsl10, sum(tsl11) as tsl11,
        sum(tsl12) as tsl12, sum(tsl13) as tsl13, sum(tsl14) as tsl14, sum(tsl15) as tsl15,
        sum(tsl16) as tsl16,
        sum(hslvt) as hslvt, sum(hsl01) as hsl01, sum(hsl02) as hsl02, sum(hsl03) as hsl03,
        sum(hsl04) as hsl04, sum(hsl05) as hsl05, sum(hsl06) as hsl06, sum(hsl07) as hsl07,
        sum(hsl08) as hsl08, sum(hsl09) as hsl09, sum(hsl10) as hsl10, sum(hsl11) as hsl11,
        sum(hsl12) as hsl12, sum(hsl13) as hsl13, sum(hsl14) as hsl14, sum(hsl15) as hsl15,
        sum(hsl16) as hsl16,
        sum(kslvt) as kslvt, sum(ksl01) as ksl01, sum(ksl02) as ksl02, sum(ksl03) as ksl03,
        sum(ksl04) as ksl04, sum(ksl05) as ksl05, sum(ksl06) as ksl06, sum(ksl07) as ksl07,
        sum(ksl08) as ksl08, sum(ksl09) as ksl09, sum(ksl10) as ksl10, sum(ksl11) as ksl11,
        sum(ksl12) as ksl12, sum(ksl13) as ksl13, sum(ksl14) as ksl14, sum(ksl15) as ksl15,
        sum(ksl16) as ksl16,
        sum(oslvt) as oslvt, sum(osl01) as osl01, sum(osl02) as osl02, sum(osl03) as osl03,
        sum(osl04) as osl04, sum(osl05) as osl05, sum(osl06) as osl06, sum(osl07) as osl07,
        sum(osl08) as osl08, sum(osl09) as osl09, sum(osl10) as osl10, sum(osl11) as osl11,
        sum(osl12) as osl12, sum(osl13) as osl13, sum(osl14) as osl14, sum(osl15) as osl15,
        sum(osl16) as osl16,
        sum(mslvt) as mslvt, sum(msl01) as msl01, sum(msl02) as msl02, sum(msl03) as msl03,
        sum(msl04) as msl04, sum(msl05) as msl05, sum(msl06) as msl06, sum(msl07) as msl07,
        sum(msl08) as msl08, sum(msl09) as msl09, sum(msl10) as msl10, sum(msl11) as msl11,
        sum(msl12) as msl12, sum(msl13) as msl13, sum(msl14) as msl14, sum(msl15) as msl15,
        sum(msl16) as msl16,
        max(timestamp_at) as timestamp_at
    from gltt1
    group by
        rclnt, ryear, objnr00, objnr01, objnr02, objnr03, objnr04, objnr05, objnr06, objnr07, objnr08,
        drcrk, rpmax, activ, rmvct, rtcur, runit, awtyp, rldnr, rrcty, rvers, logsys,
        racct, cost_elem, rbukrs, rcntr, prctr, rfarea, rbusa, kokrs, segment,
        scntr, pprctr, sfarea, sbusa, rassc, psegment,
        fikrs, rfund, rgrant_nbr, rbudget_pd, sfund, sgrant_nbr, sbudget_pd,
        re_bukrs, re_account, vname, egrup, recid
)

-- Step 5 (FGLV_FAGLFLEXT): Final aggregation collapsing fund accounting fields.
-- The FIKRS/RFUND/etc. columns present in GLTT2 are intentionally dropped here
-- to match the structure of the classic FAGLFLEXT table.
select
    rclnt,
    ryear,
    cast(objnr00 as {{ dbt.type_int() }}) as objnr00,
    cast(objnr01 as {{ dbt.type_int() }}) as objnr01,
    cast(objnr02 as {{ dbt.type_int() }}) as objnr02,
    cast(objnr03 as {{ dbt.type_int() }}) as objnr03,
    cast(objnr04 as {{ dbt.type_int() }}) as objnr04,
    cast(objnr05 as {{ dbt.type_int() }}) as objnr05,
    cast(objnr06 as {{ dbt.type_int() }}) as objnr06,
    cast(objnr07 as {{ dbt.type_int() }}) as objnr07,
    cast(objnr08 as {{ dbt.type_int() }}) as objnr08,
    drcrk,
    rpmax,
    activ,
    rmvct,
    rtcur,
    runit,
    awtyp,
    rldnr,
    rrcty,
    rvers,
    logsys,
    racct,
    cost_elem,
    rbukrs,
    rcntr,
    prctr,
    rfarea,
    rbusa,
    kokrs,
    segment,
    scntr,
    pprctr,
    sfarea,
    sbusa,
    rassc,
    psegment,
    sum(tslvt) as tslvt, sum(tsl01) as tsl01, sum(tsl02) as tsl02, sum(tsl03) as tsl03,
    sum(tsl04) as tsl04, sum(tsl05) as tsl05, sum(tsl06) as tsl06, sum(tsl07) as tsl07,
    sum(tsl08) as tsl08, sum(tsl09) as tsl09, sum(tsl10) as tsl10, sum(tsl11) as tsl11,
    sum(tsl12) as tsl12, sum(tsl13) as tsl13, sum(tsl14) as tsl14, sum(tsl15) as tsl15,
    sum(tsl16) as tsl16,
    sum(hslvt) as hslvt, sum(hsl01) as hsl01, sum(hsl02) as hsl02, sum(hsl03) as hsl03,
    sum(hsl04) as hsl04, sum(hsl05) as hsl05, sum(hsl06) as hsl06, sum(hsl07) as hsl07,
    sum(hsl08) as hsl08, sum(hsl09) as hsl09, sum(hsl10) as hsl10, sum(hsl11) as hsl11,
    sum(hsl12) as hsl12, sum(hsl13) as hsl13, sum(hsl14) as hsl14, sum(hsl15) as hsl15,
    sum(hsl16) as hsl16,
    sum(kslvt) as kslvt, sum(ksl01) as ksl01, sum(ksl02) as ksl02, sum(ksl03) as ksl03,
    sum(ksl04) as ksl04, sum(ksl05) as ksl05, sum(ksl06) as ksl06, sum(ksl07) as ksl07,
    sum(ksl08) as ksl08, sum(ksl09) as ksl09, sum(ksl10) as ksl10, sum(ksl11) as ksl11,
    sum(ksl12) as ksl12, sum(ksl13) as ksl13, sum(ksl14) as ksl14, sum(ksl15) as ksl15,
    sum(ksl16) as ksl16,
    sum(oslvt) as oslvt, sum(osl01) as osl01, sum(osl02) as osl02, sum(osl03) as osl03,
    sum(osl04) as osl04, sum(osl05) as osl05, sum(osl06) as osl06, sum(osl07) as osl07,
    sum(osl08) as osl08, sum(osl09) as osl09, sum(osl10) as osl10, sum(osl11) as osl11,
    sum(osl12) as osl12, sum(osl13) as osl13, sum(osl14) as osl14, sum(osl15) as osl15,
    sum(osl16) as osl16,
    sum(mslvt) as mslvt, sum(msl01) as msl01, sum(msl02) as msl02, sum(msl03) as msl03,
    sum(msl04) as msl04, sum(msl05) as msl05, sum(msl06) as msl06, sum(msl07) as msl07,
    sum(msl08) as msl08, sum(msl09) as msl09, sum(msl10) as msl10, sum(msl11) as msl11,
    sum(msl12) as msl12, sum(msl13) as msl13, sum(msl14) as msl14, sum(msl15) as msl15,
    sum(msl16) as msl16,
    max(timestamp_at) as faglflext_timestamp
from gltt2
group by
    rclnt, ryear,
    cast(objnr00 as {{ dbt.type_int() }}), cast(objnr01 as {{ dbt.type_int() }}),
    cast(objnr02 as {{ dbt.type_int() }}), cast(objnr03 as {{ dbt.type_int() }}),
    cast(objnr04 as {{ dbt.type_int() }}), cast(objnr05 as {{ dbt.type_int() }}),
    cast(objnr06 as {{ dbt.type_int() }}), cast(objnr07 as {{ dbt.type_int() }}),
    cast(objnr08 as {{ dbt.type_int() }}),
    drcrk, rpmax, activ, rmvct, rtcur, runit, awtyp, rldnr, rrcty, rvers, logsys,
    racct, cost_elem, rbukrs, rcntr, prctr, rfarea, rbusa, kokrs, segment,
    scntr, pprctr, sfarea, sbusa, rassc, psegment
