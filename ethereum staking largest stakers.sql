

SELECT
  d.depositor_address,
  e.entity_unique_name,
  SUM(d.amount_staked) AS total_staked
FROM
  staking_ethereum.deposits d
  JOIN staking_ethereum.entities e ON d.depositor_address = e.depositor_address
GROUP BY
  d.depositor_address,
  e.entity_unique_name
ORDER BY
  total_staked DESC
LIMIT
  20;