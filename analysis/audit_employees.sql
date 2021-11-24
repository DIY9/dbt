with emp as (
    select * from {{ ref('employees') }}
)
select * from emp