{{
    config(
        enabled=var('sap_using_acdoca', True) and
                var('sap_using_finsc_cmp_versnd', True) and
                var('sap_using_tj01', True) and
                var('sap_using_tka01', True) and
                var('sap_using_t000', True)
    )
}}

-- First step of ACDOCA transformation for COSP compatibility
-- Joins ACDOCA with configuration tables and applies initial transformations

with acdoca_base as (

    select
        a.rclnt as mandt,
        cast('00' as {{ dbt.type_string() }}) as lednr,
        a.objnr,
        a.ryear as gjahr,
        case
            when cast(a.accasty as {{ dbt.type_string() }}) != '' then cast('04' as {{ dbt.type_string() }})
            else cast('11' as {{ dbt.type_string() }})
        end as wrttp,
        v.versn,
        a.racct as kstar,
        a.hrkft,
        a.vrgng,
        a.rassc as vbund,
        a.sbusa as pargb,
        a.co_beknz as beknz,
        a.rwcur as twaer,
        -- Dynamic BUZEI field selection based on configuration
        case
            when v.field_name_buzei = 'CO_BUZEI' then a.co_buzei
            when v.field_name_buzei = 'CO_BUZEI1' then a.co_buzei1
            when v.field_name_buzei = 'CO_BUZEI2' then a.co_buzei2
            when v.field_name_buzei = 'CO_BUZEI5' then a.co_buzei5
            when v.field_name_buzei = 'CO_BUZEI6' then a.co_buzei6
            when v.field_name_buzei = 'CO_BUZEI7' then a.co_buzei7
            else a.co_buzei
        end as buzei,
        a.rldnr,
        a.poper as perio,
        a.co_meinh as meinh,
        -- Dynamic WTGBTR calculations
        case
            when v.field_name_wtgbtr_add = 'WSL' then a.wsl
            when v.field_name_wtgbtr_add = 'WSL2' then a.wsl2
            when v.field_name_wtgbtr_add = 'WSL3' then a.wsl3
            else 0
        end as wtgbtr_add,
        case
            when v.field_name_wtgbtr_subtract = 'WSL' then a.wsl
            when v.field_name_wtgbtr_subtract = 'WSL2' then a.wsl2
            when v.field_name_wtgbtr_subtract = 'WSL3' then a.wsl3
            else 0
        end as wtgbtr_subtract,
        -- Dynamic WOGBTR calculations
        case
            when cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            when v.field_name_wogbtr_add = 'CO_OSL' then a.co_osl
            when v.field_name_wogbtr_add = 'HSL' then a.hsl
            when v.field_name_wogbtr_add = 'OSL' then a.osl
            when v.field_name_wogbtr_add = 'VSL' then a.vsl
            when v.field_name_wogbtr_add = 'BSL' then a.bsl
            when v.field_name_wogbtr_add = 'CSL' then a.csl
            when v.field_name_wogbtr_add = 'DSL' then a.dsl
            when v.field_name_wogbtr_add = 'ESL' then a.esl
            when v.field_name_wogbtr_add = 'FSL' then a.fsl
            when v.field_name_wogbtr_add = 'GSL' then a.gsl
            when v.field_name_wogbtr_add = 'KSL' then a.ksl
            else 0
        end as wogbtr_add,
        case
            when v.field_name_wogbtr_subtract = 'HSL' then a.hsl
            when v.field_name_wogbtr_subtract = 'OSL' then a.osl
            when v.field_name_wogbtr_subtract = 'CO_OSL' then a.co_osl
            when v.field_name_wogbtr_subtract = 'VSL' then a.vsl
            when v.field_name_wogbtr_subtract = 'BSL' then a.bsl
            when v.field_name_wogbtr_subtract = 'CSL' then a.csl
            when v.field_name_wogbtr_subtract = 'DSL' then a.dsl
            when v.field_name_wogbtr_subtract = 'ESL' then a.esl
            when v.field_name_wogbtr_subtract = 'FSL' then a.fsl
            when v.field_name_wogbtr_subtract = 'GSL' then a.gsl
            when v.field_name_wogbtr_subtract = 'KSL' then a.ksl
            else 0
        end as wogbtr_subtract,
        -- Dynamic WKGBTR calculations
        case
            when v.field_name_wkgbtr_add = 'KSL' then a.ksl
            when v.field_name_wkgbtr_add = 'OSL' then a.osl
            when v.field_name_wkgbtr_add = 'VSL' then a.vsl
            when v.field_name_wkgbtr_add = 'BSL' then a.bsl
            when v.field_name_wkgbtr_add = 'CSL' then a.csl
            when v.field_name_wkgbtr_add = 'DSL' then a.dsl
            when v.field_name_wkgbtr_add = 'ESL' then a.esl
            when v.field_name_wkgbtr_add = 'FSL' then a.fsl
            when v.field_name_wkgbtr_add = 'GSL' then a.gsl
            when v.field_name_wkgbtr_add = 'HSL' then a.hsl
            else 0
        end as wkgbtr_add,
        case
            when v.field_name_wkgbtr_subtract = 'KSL' then a.ksl
            when v.field_name_wkgbtr_subtract = 'OSL' then a.osl
            when v.field_name_wkgbtr_subtract = 'VSL' then a.vsl
            when v.field_name_wkgbtr_subtract = 'BSL' then a.bsl
            when v.field_name_wkgbtr_subtract = 'CSL' then a.csl
            when v.field_name_wkgbtr_subtract = 'DSL' then a.dsl
            when v.field_name_wkgbtr_subtract = 'ESL' then a.esl
            when v.field_name_wkgbtr_subtract = 'FSL' then a.fsl
            when v.field_name_wkgbtr_subtract = 'GSL' then a.gsl
            when v.field_name_wkgbtr_subtract = 'HSL' then a.hsl
            else 0
        end as wkgbtr_subtract,
        -- Dynamic WKFBTR calculations
        case
            when v.field_name_wkfbtr_add = 'KFSL' then a.kfsl
            when v.field_name_wkfbtr_add = 'KFSL2' then a.kfsl2
            when v.field_name_wkfbtr_add = 'KFSL3' then a.kfsl3
            else 0
        end as wkfbtr_add,
        case
            when v.field_name_wkfbtr_subtract = 'KFSL' then a.kfsl
            when v.field_name_wkfbtr_subtract = 'KFSL2' then a.kfsl2
            when v.field_name_wkfbtr_subtract = 'KFSL3' then a.kfsl3
            else 0
        end as wkfbtr_subtract,
        -- Dynamic PAGBTR calculations
        case
            when v.field_name_pagbtr_add = 'PSL' then a.psl
            when v.field_name_pagbtr_add = 'PSL2' then a.psl2
            when v.field_name_pagbtr_add = 'PSL3' then a.psl3
            else 0
        end as pagbtr_add,
        case
            when v.field_name_pagbtr_subtract = 'PSL' then a.psl
            when v.field_name_pagbtr_subtract = 'PSL2' then a.psl2
            when v.field_name_pagbtr_subtract = 'PSL3' then a.psl3
            else 0
        end as pagbtr_subtract,
        -- Quantity and manual update fields
        case
            when cast(v.versn as {{ dbt.type_string() }}) != '000' or cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            else a.co_megbtr
        end as megbtr,
        case
            when cast(v.versn as {{ dbt.type_string() }}) != '000' or cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            else a.co_mefbtr
        end as mefbtr,
        case
            when cast(v.versn as {{ dbt.type_string() }}) != '000' or cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            else a.msl
        end as mbgbtr,
        case
            when cast(v.versn as {{ dbt.type_string() }}) != '000' or cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            else a.mfsl
        end as mbfbtr,
        cast(a.muvflg as {{ dbt.type_int() }}) as muvflg,
        a.beltp,
        a.rbukrs as bukrs,
        a.rfarea as fkber,
        a.segment,
        a.rfund as geber,
        a.rgrant_nbr as grant_nbr,
        a.rbudget_pd as budget_pd,
        a.timestamp_at as timestamp

    from {{ ref('stg_sap__acdoca') }} a
    inner join {{ ref('stg_sap__finsc_cmp_versnd') }} v
        on cast(v.mandt as {{ dbt.type_string() }}) = cast(a.rclnt as {{ dbt.type_string() }})
        and cast(v.bukrs as {{ dbt.type_string() }}) = cast(a.rbukrs as {{ dbt.type_string() }})
        and cast(v.rldnr as {{ dbt.type_string() }}) = cast(a.rldnr as {{ dbt.type_string() }})
    inner join {{ ref('stg_sap__tj01') }} t
        on cast(t.vrgng as {{ dbt.type_string() }}) = cast(a.vrgng as {{ dbt.type_string() }})
        and cast(t.xcosp as {{ dbt.type_string() }}) = 'X'
        and (cast(t.xcoss as {{ dbt.type_string() }}) = '' or t.xcoss is null)
    inner join {{ ref('stg_sap__tka01') }} tk
        on cast(tk.mandt as {{ dbt.type_string() }}) = cast(a.rclnt as {{ dbt.type_string() }})
        and cast(tk.kokrs as {{ dbt.type_string() }}) = cast(a.kokrs as {{ dbt.type_string() }})
    inner join {{ ref('stg_sap__t000') }} s
        on cast(s.mandt as {{ dbt.type_string() }}) = cast(a.rclnt as {{ dbt.type_string() }})
    where
        (
            (cast(a.co_buzei as {{ dbt.type_string() }}) != '000' and cast(a.accasty as {{ dbt.type_string() }}) != '')
            or (cast(a.mig_source as {{ dbt.type_string() }}) = 'C' and cast(a.bstat as {{ dbt.type_string() }}) = 'C')
        )
        and (
            cast(s.logsys as {{ dbt.type_string() }}) = cast(a.logsyso as {{ dbt.type_string() }})
            or cast(a.logsyso as {{ dbt.type_string() }}) = ''
            or (
                a.accasty in ('KS', 'KL')
                and (cast(s.logsys as {{ dbt.type_string() }}) = cast(tk.logsystem as {{ dbt.type_string() }}) or cast(tk.logsystem as {{ dbt.type_string() }}) = '')
            )
        )
        and cast(a.objnr as {{ dbt.type_string() }}) != ''

)

select * from acdoca_base