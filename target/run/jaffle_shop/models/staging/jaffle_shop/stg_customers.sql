

  create or replace view `striking-gadget-328313`.`dev`.`stg_customers`
  OPTIONS()
  as with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from `dbt-tutorial`.`jaffle_shop`.`customers`
)

select * from customers;

