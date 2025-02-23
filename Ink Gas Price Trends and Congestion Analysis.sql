WITH gas_metrics AS (
  SELECT
    DATE_TRUNC('hour', b.time) AS hour,
    AVG(b.base_fee_per_gas) AS avg_base_fee,
    MAX(b.base_fee_per_gas) AS max_base_fee,
    AVG(TRY_CAST(b.gas_used AS REAL) / b.gas_limit) AS gas_utilization,
    COUNT(*) AS block_count
  FROM ink.blocks AS b
  GROUP BY
    1
)
SELECT
  *
FROM gas_metrics
ORDER BY
  hour DESC