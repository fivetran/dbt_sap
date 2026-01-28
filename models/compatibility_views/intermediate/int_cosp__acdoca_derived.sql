{{
    config(
        materialized='view',
        enabled=var('sap_using_acdoca', True) and
                var('sap_using_coep', True) and
                var('sap_using_finsc_cmp_versnd', True) and
                var('sap_using_tj01', True) and
                var('sap_using_tka01', True) and
                var('sap_using_t000', True) and
                var('sap_using_t006', True)
    )
}}

-- Union of ACDOCA-derived and COEP-derived records for COSP compatibility
-- Combines data from both transformation paths

with acdoca_records as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(lednr as {{ dbt.type_string() }}) as lednr,
        cast(objnr as {{ dbt.type_string() }}) as objnr,
        cast(gjahr as {{ dbt.type_string() }}) as gjahr,
        cast(wrttp as {{ dbt.type_string() }}) as wrttp,
        cast(versn as {{ dbt.type_string() }}) as versn,
        cast(kstar as {{ dbt.type_string() }}) as kstar,
        cast(hrkft as {{ dbt.type_string() }}) as hrkft,
        cast(vrgng as {{ dbt.type_string() }}) as vrgng,
        cast(vbund as {{ dbt.type_string() }}) as vbund,
        cast(pargb as {{ dbt.type_string() }}) as pargb,
        cast(beknz as {{ dbt.type_string() }}) as beknz,
        cast(twaer as {{ dbt.type_string() }}) as twaer,
        cast(perio as {{ dbt.type_string() }}) as perio,
        cast(meinh as {{ dbt.type_string() }}) as meinh,
        cast(wtgbtr as {{ dbt.type_numeric() }}) as wtgbtr,
        cast(wogbtr as {{ dbt.type_numeric() }}) as wogbtr,
        cast(wkgbtr as {{ dbt.type_numeric() }}) as wkgbtr,
        cast(wkfbtr as {{ dbt.type_numeric() }}) as wkfbtr,
        cast(pagbtr as {{ dbt.type_numeric() }}) as pagbtr,
        cast(megbtr as {{ dbt.type_numeric() }}) as megbtr,
        cast(mefbtr as {{ dbt.type_numeric() }}) as mefbtr,
        cast(muvflg as {{ dbt.type_int() }}) as muvflg,
        cast(beltp as {{ dbt.type_string() }}) as beltp,
        cast(timestmp as {{ dbt.type_string() }}) as timestmp,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(fkber as {{ dbt.type_string() }}) as fkber,
        cast(segment as {{ dbt.type_string() }}) as segment,
        cast(geber as {{ dbt.type_string() }}) as geber,
        cast(grant_nbr as {{ dbt.type_string() }}) as grant_nbr,
        cast(budget_pd as {{ dbt.type_string() }}) as budget_pd

    from {{ ref('int_cosp__acdoca_timestamp') }}

),

coep_records as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(lednr as {{ dbt.type_string() }}) as lednr,
        cast(objnr as {{ dbt.type_string() }}) as objnr,
        cast(gjahr as {{ dbt.type_string() }}) as gjahr,
        cast(wrttp as {{ dbt.type_string() }}) as wrttp,
        cast(versn as {{ dbt.type_string() }}) as versn,
        cast(kstar as {{ dbt.type_string() }}) as kstar,
        cast(hrkft as {{ dbt.type_string() }}) as hrkft,
        cast(vrgng as {{ dbt.type_string() }}) as vrgng,
        cast(vbund as {{ dbt.type_string() }}) as vbund,
        cast(pargb as {{ dbt.type_string() }}) as pargb,
        cast(beknz as {{ dbt.type_string() }}) as beknz,
        cast(twaer as {{ dbt.type_string() }}) as twaer,
        cast(perio as {{ dbt.type_string() }}) as perio,
        cast(meinh as {{ dbt.type_string() }}) as meinh,
        cast(wtgbtr as {{ dbt.type_numeric() }}) as wtgbtr,
        cast(wogbtr as {{ dbt.type_numeric() }}) as wogbtr,
        cast(wkgbtr as {{ dbt.type_numeric() }}) as wkgbtr,
        cast(wkfbtr as {{ dbt.type_numeric() }}) as wkfbtr,
        cast(pagbtr as {{ dbt.type_numeric() }}) as pagbtr,
        cast(megbtr as {{ dbt.type_numeric() }}) as megbtr,
        cast(mefbtr as {{ dbt.type_numeric() }}) as mefbtr,
        cast(muvflg as {{ dbt.type_int() }}) as muvflg,
        cast(beltp as {{ dbt.type_string() }}) as beltp,
        cast(timestmp as {{ dbt.type_string() }}) as timestmp,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(fkber as {{ dbt.type_string() }}) as fkber,
        cast(segment as {{ dbt.type_string() }}) as segment,
        cast(geber as {{ dbt.type_string() }}) as geber,
        cast(grant_nbr as {{ dbt.type_string() }}) as grant_nbr,
        cast(budget_pd as {{ dbt.type_string() }}) as budget_pd

    from {{ ref('int_cosp__coep_derived') }}

)

select * from acdoca_records
union all
select * from coep_records