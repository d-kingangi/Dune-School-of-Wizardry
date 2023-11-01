-- query to find ETH volume of all Gnosis Safe transactions, weekly over time 

SELECT
  DATE_TRUNC('week', block_time) AS week,
  SUM(ABS(CAST(amount_raw AS DOUBLE))) / 1e18 AS eth_volume
FROM safe_ethereum.eth_transfers
GROUP BY 1