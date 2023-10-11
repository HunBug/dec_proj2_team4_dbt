with products as (
    select
        PRODUCT_ID,
        PRODUCT_NAME,
--        SUPPLIER_ID,
--        CATEGORY_ID,
        QUANTITY_PER_UNIT,
        UNIT_PRICE,
        UNITS_IN_STOCK,
        UNITS_ON_ORDER,
        REORDER_LEVEL,
        DISCONTINUED,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_products')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['PRODUCT_ID', 'dbt_valid_from']) }} as products_key,
    PRODUCT_ID,
    PRODUCT_NAME,
--        SUPPLIER_ID,
--        CATEGORY_ID,
    QUANTITY_PER_UNIT,
    UNIT_PRICE,
    UNITS_IN_STOCK,
    UNITS_ON_ORDER,
    REORDER_LEVEL,
    DISCONTINUED,
    dbt_valid_from as valid_from, 
    dbt_valid_to as valid_to
from products