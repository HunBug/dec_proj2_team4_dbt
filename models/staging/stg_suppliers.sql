select 
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country
from {{ source('postgres_rds_public', 'suppliers') }}