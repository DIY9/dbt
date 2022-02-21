
      

  create or replace table `striking-gadget-328313`.`dev`.`orders_snapshot`
  
  
  OPTIONS()
  as (
    

    select *,
        to_hex(md5(concat(coalesce(cast(id as string), ''), '|',coalesce(cast(order_date as string), '')))) as dbt_scd_id,
        order_date as dbt_updated_at,
        order_date as dbt_valid_from,
        nullif(order_date, order_date) as dbt_valid_to
    from (
        



  select * from `dbt-tutorial`.`jaffle_shop`.`orders`

    ) sbq



  );
  