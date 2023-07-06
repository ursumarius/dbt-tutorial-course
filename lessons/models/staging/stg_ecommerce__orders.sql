{#
{{
 	config(
		materialized = 'view',
	)
	}}
this would let you overwrite the default view for big query output.
easier to read- can scan, dont have to run sql. plus quicker to run
#}

WITH source AS (
	SELECT *

	FROM {{ source('thelook_ecommerce', 'orders') }}
)

SELECT
	-- IDs
	order_id,
	user_id,

	-- Timestamps
	created_at,
	returned_at,
	delivered_at,
	shipped_at,

	-- Other columns
	status,
	num_of_item AS num_items_ordered

	{#- Unused columns:
		- gender
	#}

FROM source
