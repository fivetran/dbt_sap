{{
    config(
        enabled=var('sap_using_acdoca', True) and
                var('sap_using_finsc_cmp_versnd', True) and
                var('sap_using_tj01', True) and
                var('sap_using_tka01', True) and
                var('sap_using_t000', True)
    )
}}

-- Second step of ACDOCA transformation for COSP compatibility
-- Calculates final amounts by subtracting add/subtract values

with acdoca_amounts as (

    select
        mandt,
        lednr,
        objnr,
        gjahr,
        wrttp,
        versn,
        kstar,
        hrkft,
        vrgng,
        vbund,
        pargb,
        beknz,
        twaer,
        rldnr,
        perio,
        meinh,
        -- Calculate final amounts by subtracting
        (wtgbtr_add - wtgbtr_subtract) as wtgbtr,
        (wogbtr_add - wogbtr_subtract) as wogbtr,
        (wkgbtr_add - wkgbtr_subtract) as wkgbtr,
        (wkfbtr_add - wkfbtr_subtract) as wkfbtr,
        (pagbtr_add - pagbtr_subtract) as pagbtr,
        megbtr,
        mefbtr,
        muvflg,
        beltp,
        bukrs,
        fkber,
        segment,
        geber,
        grant_nbr,
        budget_pd,
        timestamp

    from {{ ref('int_cosp__acdoca_base') }}

)

select * from acdoca_amounts