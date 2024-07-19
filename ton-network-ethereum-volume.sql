-- day
-- Daily_vol
-- Total_Vol

SELECT
  DATE_TRUNC('day', block_time) AS day,
  SUM(amount_usd) AS Daily_vol,
  SUM(SUM(amount_usd)) OVER (ORDER BY DATE_TRUNC('day', block_time)) AS Total_Vol
FROM dex.trades
WHERE
  block_time >= TRY_CAST('2023-12-01' AS TIMESTAMP)
  AND project_contract_address IN (0x4b62fa30fea125e43780dc425c2be5acb4ba743b, 0x6a9c4fc2b35ee398e7a0e75d982872466ba93cb8, 0x5f0d8fc6057a959e79f7f79f8dbf12f29f9a9f34)
GROUP BY
  1
ORDER BY
  1 DESC