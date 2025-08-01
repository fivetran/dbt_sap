{{ config(enabled=var('sap_using_t503', True) 
        and var('sap_using_pa0000', True)
        and var('sap_using_pa0001', True)
        and var('sap_using_pa0007', True)
        and var('sap_using_pa0008', True)
        and var('sap_using_pa0031', True)
        )}}

with pa0000 as (

    select *
    from {{ ref('stg_sap__pa0000') }} 
),

pa0001 as (

    select *
    from {{ ref('stg_sap__pa0001') }} 
),

pa0007 as (

    select *
    from {{ ref('stg_sap__pa0007') }} 
),

pa0008 as (

    select *
    from {{ ref('stg_sap__pa0008') }} 
),

pa0031 as (

    select *
    from {{ ref('stg_sap__pa0031') }} 
),

t503 as (

    select *
    from {{ ref('stg_sap__t503') }} 
),

employee_date_changes as ( 

    select * 
    from {{ ref('int_sap__0employee_date_changes') }}
    where endda is not null
),

final as (

    select 
        employee_date_changes.begda,
        employee_date_changes.endda,
        pa0000.pernr,
        coalesce(pa0031.rfp01, pa0031.rfp02, pa0031.rfp03, pa0031.rfp04, pa0031.rfp05,
        pa0031.rfp06, pa0031.rfp07, pa0031.rfp08, pa0031.rfp09, pa0031.rfp10,
        pa0031.rfp11, pa0031.rfp12, pa0031.rfp13, pa0031.rfp14, pa0031.rfp15,
        pa0031.rfp16, pa0031.rfp17, pa0031.rfp18, pa0031.rfp19, pa0031.rfp20) as rfpnr,
        pa0001.bukrs,
        pa0001.werks,
        pa0001.btrtl,
        pa0001.persg,
        pa0001.persk,
        pa0001.orgeh,
        pa0001.stell,
        pa0001.plans,
        pa0001.kokrs,
        pa0001.kostl, 
        pa0001.abkrs, 
        pa0008.trfar,
        pa0008.trfgb,
        t503.trfkz,
        pa0008.trfgr,
        pa0008.trfst,
        pa0008.bsgrd,
        pa0008.ancur,
        pa0007.empct,
        pa0000.stat2, 
        pa0001.ansvh,
        pa0001.vdsk1,
        pa0001.sname
    from pa0000
    left join employee_date_changes
        on pa0000.pernr = employee_date_changes.pernr
        and pa0000.begda < employee_date_changes.endda
        and pa0000.endda > employee_date_changes.begda
    left join pa0001
        on pa0001.pernr = employee_date_changes.pernr 
        and pa0001.begda < employee_date_changes.endda 
        and pa0001.endda > employee_date_changes.begda 
    left join pa0007  
        on pa0007.pernr = employee_date_changes.pernr
        and pa0007.begda < employee_date_changes.endda 
        and pa0007.endda > employee_date_changes.begda 
    left join pa0008
        on pa0008.pernr = employee_date_changes.pernr
        and pa0008.begda < employee_date_changes.endda
        and pa0008.endda > employee_date_changes.begda 
    left join pa0031
        on pa0031.pernr = employee_date_changes.pernr
        and pa0031.begda < employee_date_changes.endda
        and pa0031.endda > employee_date_changes.begda
    inner join t503
        on pa0001.mandt = t503.mandt
        and pa0001.persg = t503.persg  
        and pa0001.persk = t503.persk 
)

select *
from final