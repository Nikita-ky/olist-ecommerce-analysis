-- Data quality check: orders that have more than one review

select order_id

from public.olist_order_reviews_dataset

group by order_id
Having COUNT(*)>1