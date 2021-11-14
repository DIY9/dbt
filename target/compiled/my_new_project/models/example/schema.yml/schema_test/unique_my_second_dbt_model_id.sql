
    
    

select
    id as unique_field,
    count(*) as n_records

from `striking-gadget-328313`.`dbt_dyisar`.`my_second_dbt_model`
where id is not null
group by id
having count(*) > 1


