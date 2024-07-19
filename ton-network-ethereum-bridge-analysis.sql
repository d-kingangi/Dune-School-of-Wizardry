-- day
-- total_transfers

SELECT
  DATE_TRUNC('week', evt_block_time) AS day,
  COUNT(*) AS total_transfers
FROM erc20_ethereum.evt_transfer
WHERE
  "to" = 0xb323692b6d4DB96af1f52E4499a2bd0Ded9af3C5
GROUP BY
  DATE_TRUNC('week', evt_block_time)
ORDER BY
  day