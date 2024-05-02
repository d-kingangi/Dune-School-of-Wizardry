SELECT 
  DATE_TRUNC('week', block_date) AS week,
  COUNT(DISTINCT "from") + COUNT(DISTINCT "to") AS unique_addresses,
  COUNT(*) AS total_transactions,
  SUM(CAST(gas_price AS DECIMAL(38,0))) AS total_gas_price,  
  SUM(CAST(gas_used AS DECIMAL(38,0))) AS total_gas_used,
  SUM(CAST(value AS DECIMAL(38,0)) / 1e18) AS total_currency_volume
FROM 
  goerli.transactions
GROUP BY 
  DATE_TRUNC('week', block_date)
ORDER BY  
  DATE_TRUNC('week', block_date);
