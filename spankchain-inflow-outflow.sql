--find the inflow/outflow of token to the Spankchain contract address 

SELECT
  CASE
    WHEN "from" = 0x42d6622deCe394b54999Fbd73D108123806f6a18
    THEN 'Outflow'
    WHEN "to" = 0x42d6622deCe394b54999Fbd73D108123806f6a18
    THEN 'Inflow'
  END AS flow_type,
  SUM("value") AS token_amount
FROM "ethereum.transactions"
WHERE
  "address" = 0x42d6622deCe394b54999Fbd73D108123806f6a18
GROUP BY
  1