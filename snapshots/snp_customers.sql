{% snapshot snp_customers %}

{{
    config(
        target_schema='stage',
        strategy='check',
        unique_key='CUSTOMER_ID',
        check_cols='all'
    )
}}

select
    {{ dbt_utils.star(from=source('postgres_rds_public', 'customers'), except=["_fivetran_deleted", "_fivetran_synced"]) }}
from 
    {{ source('postgres_rds_public', 'customers')}}

{% endsnapshot %}