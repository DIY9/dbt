{% macro test_unique_together(model, fields) %}

  with exceptions as (
    select
      {% for field in fields %}
        {{ field }}{% if not loop.last %},{% endif %}
      {% endfor %}

    from
      {{ model }}

    {{ dbt_utils.group_by(n=fields|length) }}

    having
      count(*) > 1
  )

  select count(*) from exceptions

{% endmacro %}

{#
    You use the following syntax to call these tests (v1 schema.yml):

    unique_together:
    - {fields: ['field_1', 'field_2']}
#}