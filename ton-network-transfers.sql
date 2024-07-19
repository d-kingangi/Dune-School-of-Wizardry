-- month
-- total_transfers

SELECT
  DATE_TRUNC('day', evt_block_time) AS month,
  COUNT(*) AS total_transfers
FROM erc20_ethereum.evt_Transfer
WHERE
  contract_address = 0x582d872A1B094FC48F5DE31D3B73F2D9bE47def1
  AND YEAR(evt_block_time) >= 2024
GROUP BY
  DATE_TRUNC('day', evt_block_time)
ORDER BY
  month