WITH op_marg AS (
    SELECT 
        s_margin.*, 
        ship.* EXCEPT (orders_id)
    FROM {{ ref('int_sales_margin') }} AS s_margin
    LEFT JOIN {{ ref('stg_raw__ship') }} AS ship USING (orders_id) 
),

by_day AS 
( SELECT 
    *,
    CAST(margin AS INT64) + CAST(shipping_fee AS INT64) - CAST(logcost AS INT64) - CAST(ship_cost AS INT64) AS operational_margin
FROM op_marg )

SELECT 

*

FROM by_day


