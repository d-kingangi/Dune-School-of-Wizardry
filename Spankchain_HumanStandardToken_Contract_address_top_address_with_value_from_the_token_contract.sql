--addresses that have received the most value from the HumanStandardToken Contract

SELECT
  _to AS address,
  SUM(_value) AS total_received_value
FROM
  spankchain_ethereum.HumanStandardToken_call_transferFrom
WHERE
  contract_address = 0x42d6622deCe394b54999Fbd73D108123806f6a18
GROUP BY
  _to
ORDER BY
  total_received_value DESC
LIMIT
  50