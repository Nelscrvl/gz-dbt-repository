{% macro margin_calculation(purchase_cost, revenue) %}
  ROUND(SAFE_DIVIDE(purchase_cost, revenue),2) 
{% endmacro %}
