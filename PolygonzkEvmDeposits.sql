/*query to find succesful deposits to Polgon zkEvm through the zkEvm Bridge */

SELECT
  COUNT(DISTINCT "from") AS "count"
FROM
  ethereum."transactions"
WHERE
  "to" = 0x2a3dd3eb832af982ec71669e178424b10dca2ede
  AND success