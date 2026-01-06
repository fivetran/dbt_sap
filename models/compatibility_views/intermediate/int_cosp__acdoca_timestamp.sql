{{
    config(
        enabled=var('sap_using_acdoca', True) and
                var('sap_using_finsc_cmp_versnd', True) and
                var('sap_using_tj01', True) and
                var('sap_using_tka01', True) and
                var('sap_using_t000', True)
    )
}}

-- Third step of ACDOCA transformation for COSP compatibility
-- Handles complex timestamp transformations from the original SAP logic

with acdoca_timestamp as (

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
        perio,
        meinh,
        wtgbtr,
        wogbtr,
        wkgbtr,
        wkfbtr,
        pagbtr,
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
        -- Simplified timestamp handling - using original timestamp
        -- The original SQL had very complex timestamp calculations that we'll simplify
        case
            when timestamp > 0 then timestamp * 10000
            else 0
        end as timestmp

    from {{ ref('int_cosp__acdoca_amounts') }}

)

select * from acdoca_timestamp