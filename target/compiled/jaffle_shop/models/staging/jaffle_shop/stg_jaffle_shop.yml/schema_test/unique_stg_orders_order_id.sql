
    
    

select
    order_id as unique_field,
    count(*) as n_records

from `striking-gadget-328313`.`dbt_dyisar`.`stg_orders`
where order_id is not null
group by order_id
having count(*) > 1


