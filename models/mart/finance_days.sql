{{ config(materialized= 'table') }}

WITH grup AS (SELECT 

date_date, 
COUNT (orders_id) AS nb_transaction,
ROUND (SUM (revenue),2) AS revenue,
ROUND (SUM (margin),2) AS margin,
ROUND (SUM( operational_margin),2) AS operational_margin


FROM {{ref('int_orders_operational')}} AS op_margin

GROUP BY date_date 
ORDER BY date_date DESC)

SELECT 

*,
ROUND (revenue / nb_transaction, 2) AS avg_basket

FROM grup



