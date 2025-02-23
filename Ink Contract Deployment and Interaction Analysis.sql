/* Combined Analysis */
/* Contract Deployment Trends */
WITH daily_deployments AS (
  SELECT
    b.date,
    COUNT(*) AS contracts_deployed,
    COUNT(DISTINCT c."from") AS unique_deployers,
    AVG(t.gas_used) AS avg_deployment_gas
  FROM ink.contracts AS c
  JOIN ink.blocks AS b
    ON c.created_at = b.time
  JOIN ink.transactions AS t
    ON c.address = t.to
  GROUP BY
    b.date
), contract_interactions /* Contract Interaction Metrics */ AS (
  SELECT
    b.date,
    t.to AS contract_address,
    COUNT(*) AS interaction_count,
    COUNT(DISTINCT t."from") AS unique_callers,
    SUM(t.gas_used) AS total_gas_used
  FROM ink.transactions AS t
  JOIN ink.blocks AS b
    ON t.block_number = b.number
  WHERE
    t.to IN (
      SELECT
        address
      FROM ink.contracts
    )
  GROUP BY
    b.date,
    t.to
)
SELECT
  d.date,
  d.contracts_deployed,
  d.unique_deployers,
  ROUND(d.avg_deployment_gas, 2) AS avg_deployment_gas,
  COUNT(DISTINCT ci.contract_address) AS active_contracts,
  SUM(ci.interaction_count) AS total_interactions,
  SUM(ci.unique_callers) AS total_unique_callers
FROM daily_deployments AS d
LEFT JOIN contract_interactions AS ci
  ON d.date = ci.date
GROUP BY
  d.date,
  d.contracts_deployed,
  d.unique_deployers,
  d.avg_deployment_gas
ORDER BY
  d.date DESC