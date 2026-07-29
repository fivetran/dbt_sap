{{ config(enabled=var('sap_using_acdoca', True) and var('sap_using_finsc_ledger_rep', True) and var('sap_using_finsc_ld_cmp', True)) }}

with stg_sap__acdoca as (
    select *
    from {{ ref('stg_sap__acdoca') }}
),

stg_sap__finsc_ledger_rep as (
    select *
    from {{ ref('stg_sap__finsc_ledger_rep') }}
),

stg_sap__finsc_ld_cmp as (
    select *
    from {{ ref('stg_sap__finsc_ld_cmp') }}
),

-- Filter ACDOCA to asset accounting line items and join to ledger configuration
-- tables to resolve the representative ledger per depreciation area (afabe).
asset_lines as (
    select
        a.rclnt,
        a.rbukrs,
        a.anln1,
        a.anln2,
        a.ryear,
        a.afabe,
        a.subta,
        a.awref,
        a.awitgrp,
        a.awitem,
        a.mig_source,
        a.bzdat,
        a.anbwa,
        a.slalittype,
        a.movcat,
        a.vorgn,
        a.subta_rev,
        a.prec_awref,
        a.xsettled,
        a.xsettling,
        a.xreversed,
        a.xreversing,
        a.hsl
    from stg_sap__acdoca as a
    inner join stg_sap__finsc_ledger_rep as lr
        on (lr.mandt = a.rclnt and lr.rldnr_pers = a.rldnr)
    inner join stg_sap__finsc_ld_cmp as lc
        on (lc.mandt = a.rclnt and lc.bukrs = a.rbukrs and lc.rldnr = lr.rldnr)
    where
        a.anln1 != ''
        and a.awtyp != 'AMDP'
        and a.bstat != 'C'
        and a.mig_source in ('A', '')
        and (
            a.slalittype in ('07000', '07020', '07040', '07001', '07021', '07041',
                             '07002', '07022', '07042')
            or (
                a.slalittype in ('07003', '07023', '07043', '07004', '07024', '07044')
                and a.movcat in ('11', '12', '13', '14', '15', '61', '65')
            )
            or (
                a.slalittype in ('07025', '07045', '07026', '07046', '07027', '07047')
                and a.movcat in ('46', '11', '12', '13', '14', '56', '59')
            )
            or (
                a.slalittype in ('07028', '07048')
                and a.movcat in ('11', '12', '13', '14', '15', '46', '56', '59')
            )
            or (
                a.slalittype in ('07005', '07006', '07007', '07008')
                and a.movcat in ('11', '12', '13', '14', '15', '46', '56', '59')
            )
        )
        and a.movcat not in ('C7', 'E7')
),

-- Aggregate line items to the ANEP grain. Derived column expressions are deferred
-- to the final SELECT so that all GROUP BY columns are referenced directly,
-- ensuring cross-database compatibility (e.g. BigQuery disallows derived expressions
-- in SELECT that are not also in GROUP BY).
aggregated as (
    select
        rclnt,
        rbukrs,
        anln1,
        anln2,
        ryear,
        afabe,
        subta,
        awref,
        awitgrp,
        awitem,
        mig_source,
        bzdat,
        anbwa,
        slalittype,
        movcat,
        vorgn,
        subta_rev,
        prec_awref,
        xsettled,
        xsettling,
        xreversed,
        xreversing,
        sum(hsl) as anbtr
    from asset_lines
    group by
        rclnt, rbukrs, anln1, anln2, ryear, afabe, subta, awref, awitgrp, awitem,
        mig_source, bzdat, anbwa, slalittype, movcat, vorgn, subta_rev, prec_awref,
        xsettled, xsettling, xreversed, xreversing
)

select
    rclnt                                           as mandt,
    rbukrs                                          as bukrs,
    anln1,
    anln2,
    ryear                                           as gjahr,
    rtrim(substring(subta, 2, 5))                   as lnran,
    afabe,
    '0000'                                          as zujhr,
    case
        when (slalittype >= '07040' and slalittype <= '07050')
            or slalittype = '07940'
        then '0002'
        else '0001'
    end                                             as zucod,
    '000'                                           as peraf,
    awref                                           as belnr,
    case
        when mig_source = 'A' then rtrim(substring(awitgrp, 4, 3))
        else rtrim(substring(awitem, 4, 3))
    end                                             as buzei,
    bzdat,
    anbwa                                           as bwasl,
    '0'                                             as xafar,
    anbtr,
    cast(0 as {{ dbt.type_numeric() }})             as nafab,
    cast(0 as {{ dbt.type_numeric() }})             as safab,
    cast(0 as {{ dbt.type_numeric() }})             as zinsb,
    ''                                              as xantw,
    ''                                              as xawbt,
    case
        when mig_source = 'A'
            then rtrim(substring(subta_rev, 2, 5))
        when vorgn in ('OCAB', 'OCZU')
            then '99999'
        else rtrim(substring(subta_rev, 2, 5))
    end                                             as lnsan,
    ''                                              as anupd,
    case
        when subta_rev > '000000'
            then rtrim(substring(subta_rev, 2, 5))
        when (xsettled = 'X' or xsettling = 'X')
            and prec_awref = ''
            and subta_rev = '000000'
            then '99999'
        when (
                (xsettled = '' and xsettling = ''
                    and xreversed = '' and xreversing = '')
                or (xreversing = 'X' and subta_rev = '000000')
                or (xreversed = 'X' and subta_rev = '000000')
            )
            then '00000'
        else '99999'
    end                                             as augln
from aggregated
