{{ config(enabled=(var('sap_using_pa0000', True) and var('sap_using_pa0001', True) and var('sap_using_pa0007', True) and var('sap_using_pa0008', True) and var('sap_using_pa0031', True))) }}

{% set employee_models = ['pa0000', 'pa0001', 'pa0007', 'pa0008', 'pa0031'] %}

with
{% for employee_model in employee_models if var('sap_using_' ~ employee_model, True)  %}
    {{ employee_model }}_beg as (
        select
            pernr,
            begda as date_change
        from {{ ref('stg_sap__' + employee_model) }}
    ),

    {{ employee_model }}_end as (
        select
            pernr,
			case when endda = '99991231' then endda
				else {{ add_day_to_char_date('endda') }} 
				end as date_change
		from {{ ref('stg_sap__' + employee_model) }}
	), 
{% endfor %}


unioned as (

	{% for employee_model in employee_models %}
		select 
			pernr,
			date_change 
		from {{ employee_model }}_beg 

		union all

		select 
			pernr,
			date_change 
		from {{ employee_model }}_end 

		{% if not loop.last %}
		union all
		{% endif %} 
	{% endfor %}
),
	

unioned_dates as (
	
	select pernr, date_change 
	from unioned
	{{ dbt_utils.group_by(2) }}
	order by pernr, date_change
),

employee_date_ranges as (

	select 
		pernr,
		date_change as begda,
		lead(date_change, 1) over (partition by pernr order by date_change) as endda      
	from unioned_dates			
),

employee_original_date_ranges as (

	select
		pernr,
		begda,
		case when endda = '99991231' then endda
			else {{ subtract_day_to_char_date('endda') }} 
			end as endda
	from employee_date_ranges
)

select * 
from employee_original_date_ranges