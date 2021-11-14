

  create or replace view `striking-gadget-328313`.`dbt_dyisar`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `striking-gadget-328313`.`dbt_dyisar`.`my_first_dbt_model`
where id = 1;

