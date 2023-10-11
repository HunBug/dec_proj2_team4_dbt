with employees as (
    select
        EMPLOYEE_ID,
        LAST_NAME,
        FIRST_NAME,
        TITLE,
        TITLE_OF_COURTESY,
        BIRTH_DATE,
        HIRE_DATE,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        COUNTRY,
        HOME_PHONE,
        EXTENSION,
        NOTES,
        REPORTS_TO,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_employees')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['EMPLOYEE_ID', 'dbt_valid_from']) }} as products_key,
    EMPLOYEE_ID,
    LAST_NAME,
    FIRST_NAME,
    TITLE,
    TITLE_OF_COURTESY,
    BIRTH_DATE,
    HIRE_DATE,
    ADDRESS,
    CITY,
    REGION,
    POSTAL_CODE,
    COUNTRY,
    HOME_PHONE,
    EXTENSION,
    NOTES,
    REPORTS_TO,
    dbt_valid_from as valid_from, 
    dbt_valid_to as valid_to
from employees