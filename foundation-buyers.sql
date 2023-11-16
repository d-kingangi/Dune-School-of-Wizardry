--foundation top buyers

SELECT
  buyer,
  collection,
  SUM(number_of_items) AS total_number_of_items_bought,
  SUM(amount_usd) AS total_amount_usd_paid,
  SUM(platform_fee_amount_usd) AS total_platform_fee_amount_usd
FROM
  nft.trades
GROUP BY
  buyer, collection
ORDER BY
  total_number_of_items_bought DESC
LIMIT 40; --set limit of buyers