// column must be positive
// macros can be used for custom generic test too

{% test positive_values(model, column_name) %}
SELECT
    *
FROM
    {{ model }}
WHERE
    {{ column_name}} < 1
{% endtest %}