with customers as (
    select
        CUSTOMER_ID,
        COMPANY_NAME,
        CONTACT_NAME,
        CONTACT_TITLE,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        COUNTRY,
        PHONE,
        FAX,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_customers')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER_ID', 'dbt_valid_from']) }} as products_key,
    CUSTOMER_ID,
    COMPANY_NAME,
    CONTACT_NAME,
    CONTACT_TITLE,
    ADDRESS,
    CITY,
    REGION,
    POSTAL_CODE,
    COUNTRY,
    PHONE,
    FAX,
    dbt_valid_from as valid_from, 
    dbt_valid_to as valid_to
from customers