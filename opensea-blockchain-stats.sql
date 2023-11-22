SELECT
  blockchain,
  SUM(amount_usd) AS amountUSD,
  SUM(number_of_items) AS items,
  SUM(platform_fee_amount_usd) AS platformFeeUSD,
  AVG(platform_fee_percentage) AS avgPlatformFeePercentage,
  COUNT(DISTINCT collection) AS distinctCollections,
  AVG(royalty_fee_percentage) AS avgRoyaltyFeePercentage
FROM
  opensea.trades
GROUP BY
  blockchain;