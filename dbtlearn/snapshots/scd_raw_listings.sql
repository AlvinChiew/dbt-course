// create type-2 SCD for listings
// snapshot ignore update if `update_at` < max(`update_at`) in scd
// snapshot ignore interval changes between two `dbt snapshot` executions. Only last update is recorded while running `dbt snapshot`
// snapshot ignore changes if `updated_at` is not updated. So it's very important to set `updated_at` = `CURRENT_TIMESTAMP()`

{% snapshot scd_raw_listings %}

{{
   config(
       target_schema='dev',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True
   )
}}

select * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}
