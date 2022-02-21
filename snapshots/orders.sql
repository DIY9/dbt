{% snapshot orders_snapshot %}

{{
  config(
    target_schema = 'dev',
    unique_key = 'id',
    strategy = 'timestamp',
    updated_at = 'order_date'
  )
}}

  select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}