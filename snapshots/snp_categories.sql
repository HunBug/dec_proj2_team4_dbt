{% snapshot snp_categories %}

{{
    config(
        strategy='check',
        unique_key='CATEGORY_ID',
        check_cols='all'
    )
}}

select
    {{ dbt_utils.star(from=source('postgres_rds_public', 'categories'), except=["_fivetran_deleted", "_fivetran_synced"]) }}
from 
    {{ source('postgres_rds_public', 'categories')}}

{% endsnapshot %}