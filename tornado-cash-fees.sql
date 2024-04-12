--tornado cash total fees

SELECT
  SUM(_fee) / CAST(1e18 AS DOUBLE) AS fees_eth,
  SUM(_fee * p.price) / CAST(1e18 AS DOUBLE) AS fees_usd
FROM
  tornado_cash_ethereum.eth_call_withdraw
  LEFT JOIN prices.usd AS p ON p.minute = DATE_TRUNC('minute', call_block_time)
WHERE
  p.blockchain = 'ethereum'