with product_agg as (
    select
        product_id,
        max(unit_price) as max_unit_price,
        min(unit_price) as min_unit_price,
        count(distinct supplier_id) as suppliers_count
    from {{ ref('snp_products') }}
    group by product_id
),

transform as (
    select
        stg_products.product_id,
        unit_price as latest_unit_price,
        max_unit_price,
        min_unit_price,
        suppliers_count
    from {{ ref('stg_products') }}
    left join product_agg on product_agg.product_id = stg_products.product_id 
)

select
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_fk,
    product_id,
    latest_unit_price,
    max_unit_price,
    min_unit_price,
    suppliers_count
from transform