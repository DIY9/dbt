select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with parent as (

    select
        customer_id as id

    from `striking-gadget-328313`.`dev`.`stg_customers`

),

child as (

    select
        customer_id as id

    from `striking-gadget-328313`.`dev`.`stg_orders`

)

select *
from child
where id is not null
  and id not in (select id from parent)


      
    ) dbt_internal_test