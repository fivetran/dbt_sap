{% set employee_models = ['pa0000', 'pa0001', 'pa0007', 'pa0008', 'pa0031'] %}

with
{% for employee_model in employee_models %}
    {{ employee_model }}_beg as (
        select
            pernr,
            begda as date_change
        from {{ var(employee_model) }}
    ),

    {{ employee_model }}_end as (
        select
            pernr,
			case when endda = '99991231' then endda
				else {{ add_day_to_char_date('endda') }} 
				end as date_change
		from {{ var(employee_model) }}
	), 
{% endfor %}

unioned_dates as (

	{% for employee_model in employee_models %}
	
		{% if target.type == 'bigquery' %}
		select 
			pernr,
			date_change 
		from {{ employee_model }}_beg
		{{ dbt_utils.group_by(2) }}

		union distinct

		select 
			pernr,
			date_change 
		from {{ employee_model }}_end
		{{ dbt_utils.group_by(2) }}

		{% if not loop.last %}
		union distinct
		{% endif %} 

		{% else %}
		select 
			pernr,
			date_change 
		from {{ employee_model }}_beg
		{{ dbt_utils.group_by(2) }}

		union 

		select 
			pernr,
			date_change 
		from {{ employee_model }}_end
		{{ dbt_utils.group_by(2) }}

		{% if not loop.last %}
		union
		{% endif %} 

		{% endif %} 
	{% endfor %}
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