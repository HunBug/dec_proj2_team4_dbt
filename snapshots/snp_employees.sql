{% snapshot snp_employees %}

{{
    config(
        target_schema='stage',
        strategy='check',
        unique_key='EMPLOYEE_ID',
        check_cols=['TITLE','TITLE_OF_COURTESY','HIRE_DATE','ADDRESS','CITY','REGION','POSTAL_CODE','COUNTRY','HOME_PHONE','EXTENSION','NOTES','REPORTS_TO']
    )
}}

select
    {{ dbt_utils.star(from=source('postgres_rds_public', 'employees'), except=["_fivetran_deleted", "_fivetran_synced", "photo", "photo_path"]) }}
from 
    {{ source('postgres_rds_public', 'employees')}}

{% endsnapshot %}