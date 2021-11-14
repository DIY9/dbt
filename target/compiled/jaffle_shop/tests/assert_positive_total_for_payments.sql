select
    order_id,
    sum(amount) as total_amount
from `striking-gadget-328313`.`dbt_dyisar`.`stg_payments`
group by 1
having not(total_amount >= 0)