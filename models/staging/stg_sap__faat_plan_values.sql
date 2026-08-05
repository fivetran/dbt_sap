{{ config(enabled=var('sap_using_faat_plan_values', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__faat_plan_values_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__faat_plan_values_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_faat_plan_values_columns()
            )
        }}
    from base
),

final as (

    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(anln1 as {{ dbt.type_string() }}) as anln1,
        cast(anln2 as {{ dbt.type_string() }}) as anln2,
        cast(gjahr as {{ dbt.type_string() }}) as gjahr,
        cast(peraf as {{ dbt.type_string() }}) as peraf,
        cast(afaber as {{ dbt.type_string() }}) as afaber,
        cast(afbnr as {{ dbt.type_string() }}) as afbnr,
        cast(zujhr as {{ dbt.type_string() }}) as zujhr,
        cast(zucod as {{ dbt.type_string() }}) as zucod,
        aufwp,
        aufwb,
        aufwz,
        nafap,
        nafag,
        nafaz,
        safap,
        safag,
        safaz,
        aafap,
        aafag,
        aafaz,
        mafap,
        mafag,
        mafaz,
        zinsp,
        zinsg,
        zinsz,
        aufnp,
        aufng,
        aufnz,
        answl,
        invzm,
        cast(afasl as {{ dbt.type_string() }}) as afasl,
        cast(kostl as {{ dbt.type_string() }}) as kostl,
        cast(gsber as {{ dbt.type_string() }}) as gsber,
        cast(caufn as {{ dbt.type_string() }}) as caufn,
        cast(xunul as {{ dbt.type_string() }}) as xunul,
        cast(anupd as {{ dbt.type_string() }}) as anupd,
        cast(fkber as {{ dbt.type_string() }}) as fkber,
        cast(belnr as {{ dbt.type_string() }}) as belnr,
        cast(lstar as {{ dbt.type_string() }}) as lstar,
        cast(geber as {{ dbt.type_string() }}) as geber,
        cast(grant_nbr as {{ dbt.type_string() }}) as grant_nbr,
        cast(geber2 as {{ dbt.type_string() }}) as geber2,
        cast(fkber2 as {{ dbt.type_string() }}) as fkber2,
        cast(grant_nbr2 as {{ dbt.type_string() }}) as grant_nbr2,
        cast(fistl2 as {{ dbt.type_string() }}) as fistl2,
        cast(imkey as {{ dbt.type_string() }}) as imkey,
        cast(ps_psp_pnr2 as {{ dbt.type_string() }}) as ps_psp_pnr2,
        cast(budget_pd as {{ dbt.type_string() }}) as budget_pd,
        cast(budget_pd2 as {{ dbt.type_string() }}) as budget_pd2,
        cast(segment as {{ dbt.type_string() }}) as segment,
        cast(prctr as {{ dbt.type_string() }}) as prctr,
        cast(fistl as {{ dbt.type_string() }}) as fistl,
        _fivetran_synced
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
