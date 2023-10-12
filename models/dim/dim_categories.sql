{{
    config(
        materialized='table'
    )
}}

select 
    dbt_scd_id as categories_key
    ,{{ dbt_utils.star(from=ref('snp_categories')) }}
from {{ ref('snp_categories')}}