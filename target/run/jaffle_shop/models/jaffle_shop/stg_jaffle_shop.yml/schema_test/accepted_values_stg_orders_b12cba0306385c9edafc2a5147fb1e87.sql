select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

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
    'completed','shipped','returned','placed'
)



      
    ) dbt_internal_test