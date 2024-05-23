SELECT
  e.entity,
  f.depositor_address,
  e.entity_unique_name,
  SUM(
    f.amount_full_withdrawn + f.amount_partial_withdrawn
  ) AS total_withdrawn
FROM
  staking_ethereum.flows f
  JOIN staking_ethereum.entities e ON f.depositor_address = e.depositor_address
GROUP BY
  e.entity,
  f.depositor_address,
  e.entity_unique_name
ORDER BY
  total_withdrawn DESC;