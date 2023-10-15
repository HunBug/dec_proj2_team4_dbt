with stg_suppliers as (
    select *
    from {{ ref('stg_suppliers') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['stg_suppliers.supplier_id']) }} as supplier_key,
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city as city_name,
    region,
    postal_code,
    country as country_name
from stg_suppliers