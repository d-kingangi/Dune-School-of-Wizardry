--number of addresses that have interacted with the spankchain contract address

SELECT
  COUNT(DISTINCT "from") 
  + 
  COUNT(DISTINCT "to") 
  AS unique_addresses
FROM
  "ethereum.transactions"
WHERE
  address = "0x42d6622deCe394b54999Fbd73D108123806f6a18";

--   result = 10522 addresses