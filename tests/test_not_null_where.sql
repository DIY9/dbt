{% macro test_not_null_where(model, field, condition) %}

  with exceptions as (
    select
      count(*)

    from
      {{ model }}

    where
      {{ field }} is null
      and {{ condition }}

  )

  select * from exceptions

{% endmacro %}

{{
    You use the following syntax to call these tests (v1 schema.yml):
    
    not_null_where:
    - {field: 'field_1', condition: "another_field = 'something'"}
    - {field: 'field_1', condition: "another_field > 0"}
    - {field: 'field_1', condition: "not(field_2 = 'a' and field_3 = 'b')"}
}}