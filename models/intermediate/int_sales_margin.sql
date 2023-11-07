WITH joined_data AS (
    SELECT 
        sales.*, 
        product.purchase_price

    FROM {{ ref('stg_raw__sales') }} AS sales

    LEFT JOIN {{ ref('stg_raw__product') }} AS product ON sales.products_id  = product.products_id
)

SELECT 

*,
CAST(quantity AS INT64) * CAST(purchase_price AS FLOAT64) AS purchase_cost,
CAST(revenue AS INT64) * CAST(purchase_price AS FLOAT64) AS margin 


FROM joined_data

