{% macro tag(column_name) %}

CASE
    WHEN PRICE_PER_NIGHT < 100 THEN 'low'
    WHEN PRICE_PER_NIGHT < 200 THEN 'medium'
    ELSE 'high'
END

{% endmacro %}