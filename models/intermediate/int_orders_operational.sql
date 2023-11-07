WITH op_marg AS (
    SELECT 
        o_margin.*, 
        ship.* EXCEPT (orders_id)
    FROM {{ ref('int_orders_margin') }} AS o_margin
    LEFT JOIN {{ ref('stg_raw__ship') }} AS ship USING (orders_id) 
)



SELECT 
    *,
    (CAST(margin AS INT64) + CAST(shipping_fee AS INT64)) - (CAST(logcost AS INT64) - CAST(ship_cost AS INT64)) AS operational_margin
FROM op_marg 







