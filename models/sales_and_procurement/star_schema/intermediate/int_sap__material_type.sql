{{ config(enabled=(var('sap_using_t134', True) and var('sap_using_t134t', True))) }}

with t134 as (
    select *
    from {{ ref('stg_sap__t134') }}

), t134t as (
    select *
    from {{ ref('stg_sap__t134t') }}

), final as (
    select
        t134.mandt as client_id,
        t134.mtart as material_type_id,
        t134.mtref as reference_material_type,
        t134.mbref as sref_material_type,
        t134.flref as field_reference_id,
        t134.numki as number_range,
        t134.numke as numke,
        t134.envop as external_no_assignment_w_o_check,
        t134.bsext as external_purchase_orders_allowed,
        t134.bsint as internal_purchase_orders_allowed,
        t134.pstat as maintenance_status,
        t134.kkref as account_category_reference_id,
        t134.vprsv as price_control,
        t134.kzvpr as price_control_mandatory,
        t134.vmtpo as item_category_group_id,
        t134.ekalr as with_qty_structure,
        t134.kzgrp as grouping_indicator,
        t134.kzkfg as configurable_material,
        t134.begru as authorization_group_id,
        t134.kzprc as material_f_process,
        t134.kzpip as pipeline_handling_mandatory,
        t134.prdru as print_price,
        t134.aranz as display_material,
        t134.wmakg as wmakg,
        t134.izust as initial_status_new_batch,
        t134.ardel as time_till_deleted,
        t134.kzmpn as manufacturer_part,
        t134.mstae as cross_plant_material_status_id,
        t134.cchis as history_reqmt,
        t134.ctype as class_type_id,
        t134.class as class_number,
        t134.chneu as create_new_batch,
        t134.vtype as version_category_id,
        t134.vnumki as vnumki,
        t134.vnumke as vnumke,
        t134.kzrac as mand_rp_logistics,
        t134.hvr_is_deleted as hvr_is_deleted,
        t134.hvr_change_time as hvr_change_time,
        t134t.mtbez as description_material_type
    from t134
    left join t134t
        on t134.mandt = t134t.mandt
        and t134.mtart = t134t.mtart
        and t134t.spras = 'e'
    where t134.mandt in ('{{ var("sales_and_procurement_mandt_var", "800") }}')
)

select *
from final