{% macro test_not_null(model) %}

  {% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

  {% set test_in_env = kwargs.get('env') %}
  
  {#-
  We should run this test when:
  * the environment has not been specified OR,
  * we are in the specified environment
  -#}
  {%- if test_in_env is none or target.name == test_in_env -%}

    select count(*)
    from {{ model }}
    where {{ column_name }} is null

  {#- 
  We should skip this test otherwise, which we do by returning 0
  -#}
  {%- else -%}

    select 0

  {%- endif -%}

{% endmacro %}

{#
    Then in our schema.yml files, we can specify environments by using our env key:

    models:
    - name: orders
        columns:
            - name: order_id
            tests:
                # this test will run in all environments
                - not_null

            - name: customer_id
            tests:
                # this test will only run when target.name == prod
                - not_null:
                    env: prod
#}
