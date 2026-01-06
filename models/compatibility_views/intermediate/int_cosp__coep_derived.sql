{{
    config(
        enabled=var('sap_using_coep', True) and
                var('sap_using_tj01', True) and
                var('sap_using_tka01', True) and
                var('sap_using_t000', True) and
                var('sap_using_t006', True)
    )
}}

-- COEP-derived records for COSP compatibility view
-- Handles the V_COSP_R_3S logic from the original SQL

with coep_base as (

    select
        c.mandt,
        c.lednr,
        c.objnr,
        c.gjahr,
        c.wrttp,
        c.versn,
        c.kstar,
        c.hrkft,
        c.vrgng,
        c.vbund,
        c.pargb,
        c.beknz,
        c.twaer,
        c.perio,
        c.meinh,
        c.wtgbtr,
        c.wogbtr,
        c.wkgbtr,
        c.wkfbtr,
        c.pagbtr,
        c.megbtr,
        c.mefbtr,
        c.beltp,
        c.timestmp,
        c.bukrs,
        c.fkber,
        c.segment,
        c.geber,
        c.grant_nbr,
        c.budget_pd,
        c.mvflg,
        c.meinb,
        -- Calculate MUVFLG based on complex logic from original
        case
            when (cast(c.mvflg as {{ dbt.type_string() }}) = '' and c.megbtr = 0 and c.mefbtr = 0) then
                case
                    when (c.meinb = c.meinh or coalesce(t_meinh.dimid, '') = coalesce(t_meinb.dimid, '')) then cast('0' as {{ dbt.type_string() }})
                    else cast('1' as {{ dbt.type_string() }})
                end
            else
                case
                    when cast(c.mvflg as {{ dbt.type_string() }}) = 'Y' then cast('1' as {{ dbt.type_string() }})
                    when (cast(c.mvflg as {{ dbt.type_string() }}) = '' and c.megbtr = 0 and c.mefbtr = 0) then cast('1' as {{ dbt.type_string() }})
                    else cast('0' as {{ dbt.type_string() }})
                end
        end as muvflg_calc

    from {{ ref('stg_sap__coep') }} c
    inner join {{ ref('stg_sap__tj01') }} j
        on cast(j.vrgng as {{ dbt.type_string() }}) = cast(c.vrgng as {{ dbt.type_string() }})
        and cast(j.wtkat as {{ dbt.type_string() }}) = 'A'
        and cast(j.xcosp as {{ dbt.type_string() }}) = 'X'
    left join {{ ref('stg_sap__t006') }} t_meinb
        on cast(t_meinb.mandt as {{ dbt.type_string() }}) = cast(c.mandt as {{ dbt.type_string() }})
        and cast(t_meinb.msehi as {{ dbt.type_string() }}) = cast(c.meinb as {{ dbt.type_string() }})
    left join {{ ref('stg_sap__t006') }} t_meinh
        on cast(t_meinh.mandt as {{ dbt.type_string() }}) = cast(c.mandt as {{ dbt.type_string() }})
        and cast(t_meinh.msehi as {{ dbt.type_string() }}) = cast(c.meinh as {{ dbt.type_string() }})
    inner join {{ ref('stg_sap__tka01') }} t
        on cast(t.mandt as {{ dbt.type_string() }}) = cast(c.mandt as {{ dbt.type_string() }})
        and cast(t.kokrs as {{ dbt.type_string() }}) = cast(c.kokrs as {{ dbt.type_string() }})
    inner join {{ ref('stg_sap__t000') }} s
        on cast(s.mandt as {{ dbt.type_string() }}) = cast(c.mandt as {{ dbt.type_string() }})
        and (
            cast(s.logsys as {{ dbt.type_string() }}) = cast(c.logsyso as {{ dbt.type_string() }})
            or cast(c.logsyso as {{ dbt.type_string() }}) = ''
            or (
                c.accasty in ('KS', 'KL')
                and (cast(s.logsys as {{ dbt.type_string() }}) = cast(t.logsystem as {{ dbt.type_string() }}) or cast(t.logsystem as {{ dbt.type_string() }}) = '')
            )
        )
    where cast(c.wrttp as {{ dbt.type_string() }}) = '11'

),

coep_final as (

    select
        mandt,
        lednr,
        objnr,
        gjahr,
        cast('11' as {{ dbt.type_string() }}) as wrttp,
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
        case
            when cast(muvflg_calc as {{ dbt.type_string() }}) = '1' then 1
            else 0
        end as muvflg,
        beltp,
        timestmp,
        bukrs,
        fkber,
        segment,
        geber,
        grant_nbr,
        budget_pd

    from coep_base

)

select * from coep_final