SELECT

DATE_TRUNC(date_date, month) AS date_month,
SUM (ads_margin) AS ads_margin,
ROUND(SUM (avg_basket),2) AS average_basket,
SUM (operational_margin) AS operational_margin


FROM {{ref('finance_campaigns_day')}}

GROUP BY date_month