--ETH bridged to the BASE L2 via contract address

SELECT
  DATE_TRUNC('day', t.block_time) AS Date,
  ROUND(SUM(t.value) / 1e18, 3) AS TotalETHBridged
FROM
  ethereum.transactions AS t
WHERE
  t.to = 0x49048044D57e1C92A77f79988d21Fa8fAF74E97e --base contract address
  AND t.block_time >= TRY_CAST('2023-07-29 12:00:00' AS TIMESTAMP)
GROUP BY
  DATE_TRUNC('day', t.block_time)
ORDER BY
  Date DESC