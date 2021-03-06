-- macros/test_unique.sql
{% macro test_unique(model) %}
{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}
{% set error_threshold = kwargs.get('error_threshold', 0) %}
with validation_errors as (
    select
        {{ column_name }}
    from {{ model }}
    where {{ column_name }} is not null
    group by {{ column_name }}
    having count(*) > 1
),
aggregated as (
    select
        count(*) as n_errors
    from validation_errors
    group by 1
)
select
    case
      when n_errors <= {{ error_threshold }} then 0
      else n_errors
    end as result
from aggregated
{% endmacro %}