{% snapshot snp_products %}

{{
    config(
        target_schema='stage',
        strategy='check',
        unique_key='PRODUCT_ID',
        check_cols='all'
    )
}}

select
    {{ dbt_utils.star(from=source('postgres_rds_public', 'products'), except=["_fivetran_deleted", "_fivetran_synced"]) }}
from 
    {{ source('postgres_rds_public', 'products')}}

{% endsnapshot %}