--opensea stats

SELECT
  COUNT(DISTINCT blockchain) AS chains,
  SUM(amount_usd) as USD,
  COUNT(DISTINCT project) AS projects,
  SUM(platform_fee_amount_raw) / 1e18 AS rawFees,
  SUM(platform_fee_amount) as feeAmount,
  SUM(platform_fee_amount_usd) as feeUSD,
  AVG(platform_fee_percentage) as avgPercentage,
  SUM(royalty_fee_amount) as royalty
FROM
  opensea.trades