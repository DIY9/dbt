
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from `striking-gadget-328313`.`dbt_dyisar`.`stg_orders`
    group by 1

)

select *
from all_values
where value_field not in (
    'completed','shipped','returned','placed','return_pending'
)


