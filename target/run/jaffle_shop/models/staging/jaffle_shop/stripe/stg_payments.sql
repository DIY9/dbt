

  create or replace view `striking-gadget-328313`.`dev`.`stg_payments`
  OPTIONS()
  as select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    -- amount / 100 as amount,
    round( 1.0 * amount / 100, 4) as amount, 
    created as created_at

from `dbt-tutorial`.`stripe`.`payment`;

