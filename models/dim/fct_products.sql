with product_agg as (
    select
        product_id,
        max(unit_price) as max_unit_price,
        min(unit_price) as min_unit_price,
        avg(unit_price) as avg_unit_price,
        count(distinct supplier_id) as suppliers_count
    from {{ ref('snp_products') }}
    group by product_id
),

transform as (
    select
        stg_products.product_id as product_id,
        stg_products.supplier_id as supplier_id,
        product_name,
        unit_price as latest_unit_price,
        max_unit_price,
        min_unit_price,
        avg_unit_price,
        suppliers_count
    from {{ ref('stg_products') }}
    left join product_agg on product_agg.product_id = stg_products.product_id 
    left join {{ ref('stg_suppliers')}} on stg_suppliers.supplier_id = stg_products.supplier_id
)

select
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_fk,
    {{ dbt_utils.generate_surrogate_key(['supplier_id']) }} as supplier_fk,
    product_id,
    supplier_id,
    product_name,
    latest_unit_price,
    max_unit_price,
    min_unit_price,
    avg_unit_price,
    suppliers_count
from transform