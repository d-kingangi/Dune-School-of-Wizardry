/* query to find unique deposits to Polygon for unique chains*/
 SELECT
  "type" AS ChainID,
  COUNT(DISTINCT "from") AS DepositCount
FROM ethereum."transactions"
WHERE
  "to" = 0x2a3dd3eb832af982ec71669e178424b10dca2ede AND success
GROUP BY
  "type"