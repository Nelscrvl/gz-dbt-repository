{% margin_calculation (margin, revenue) %}
       
        SELECT *,
        SAFE_DIVIDE(margin / revenue) AS margin_percent
        from {{table}}

{% endmacro %}