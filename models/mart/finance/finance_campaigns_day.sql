SELECT 
f. *,
f.operational_margin - campaign_day.ads_cost AS ads_margin

FROM {{ref ('finance_days')}} AS f
INNER JOIN {{ref('int_campaigns_day')}} AS campaign_day USING (date_date)
ORDER BY date_date