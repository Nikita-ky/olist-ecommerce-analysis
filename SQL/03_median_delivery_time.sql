-- Median delivery time in days: delivered_customer_date - purchase_timestamp

Select PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (to_char(o.order_delivered_customer_date::date, 'YYYY-MM-DD')::date - TO_CHAR(o.order_purchase_timestamp::date, 'YYYY-MM-DD')::date)::int) as  delay_days
from public.olist_orders_dataset o
WHERE o.order_delivered_customer_date IS NOT NULL
order by delay_days



