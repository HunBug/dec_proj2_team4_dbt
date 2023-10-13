{% test check_round(model, column_name, max_fraction_digits) %}

    select 
        {{ column_name }},
        ABS({{ column_name }}) - FLOOR(ABS({{ column_name }})) as fraction,
        cast(fraction as varchar(20)) as fraction_str,
        len(fraction_str) as str_len,
        str_len - 2 as fraction_digits
    from {{ model }}
    where fraction_digits > {{max_fraction_digits}}

{% endtest %}