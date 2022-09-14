// columns must not have null values
// `FALSE` is to cater the last column `OR` in `WHERE` clause
// `-` is to clear whitespaces to make single line expression

{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}
