--top addresses withe the most value sent to the Spankchain HumanStandardToken Address

SELECT
  _from AS address,
  SUM(_value) AS total_sent_value
FROM
  spankchain_ethereum.HumanStandardToken_call_transferFrom
WHERE
  contract_address = 0x42d6622deCe394b54999Fbd73D108123806f6a18
GROUP BY
  _from
ORDER BY
  total_sent_value DESC
LIMIT
  50