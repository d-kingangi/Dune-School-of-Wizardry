SELECT
  t.blockchain,
  t.collection,
  t.amountUSD,
  t.numberOfItems,
  t.platformFeeAmountUSD,
  t.platformFeePercentage,
  t.royaltyFeePercentage,
  t.totalDistinctCollections
FROM
  (
    SELECT
      blockchain,
      collection,
      SUM(amount_usd) AS amountUSD,
      SUM(number_of_items) AS numberOfItems,
      SUM(platform_fee_amount_usd) AS platformFeeAmountUSD,
      AVG(platform_fee_percentage) AS platformFeePercentage,
      AVG(royalty_fee_percentage) AS royaltyFeePercentage,
      COUNT(DISTINCT collection) AS totalDistinctCollections
    FROM
      opensea.trades
    GROUP BY
      blockchain,
      collection
  ) t
UNION ALL
SELECT
  'Total' AS blockchain,
  NULL AS collection,
  SUM(amount_usd) AS amountUSD,
  SUM(number_of_items) AS numberOfItems,
  SUM(platform_fee_amount_usd) AS platformFeeAmountUSD,
  AVG(platform_fee_percentage) AS platformFeePercentage,
  AVG(royalty_fee_percentage) AS royaltyFeePercentage,
  COUNT(DISTINCT collection) AS totalDistinctCollections
FROM
  opensea.trades;