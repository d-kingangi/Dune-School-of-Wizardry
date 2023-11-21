--stats for collections on OpenSea
SELECT
  collection,
  SUM(amount_usd) AS amountUSD,
  SUM(royalty_fee_amount_usd) AS royaltyFeeUSD,
  AVG(royalty_fee_percentage) AS royaltyFeePercent,
  SUM(platform_fee_amount_usd) AS platformFeeUSD,
  SUM(number_of_items) AS items,
FROM
  opensea.trades
GROUP BY
  collection;
