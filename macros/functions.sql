{% macro margin_calculation(table) %}
SELECT *,
  ROUND(SAFE_DIVIDE(margin, revenue),2) AS margin_percent
FROM {{table}}
{% endmacro %}
