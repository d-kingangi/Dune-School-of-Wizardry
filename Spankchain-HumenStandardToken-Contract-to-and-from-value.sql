SELECT
  address,
  SUM(total_value) AS total_value
FROM (
  SELECT
    _to AS address,
    SUM(_value) AS total_value
  FROM spankchain_ethereum.HumanStandardToken_call_transferFrom
  WHERE
    contract_address = 0x42d6622deCe394b54999Fbd73D108123806f6a18
  GROUP BY
    _to
  UNION ALL
  SELECT
    _from AS address,
    SUM(_value) AS total_value
  FROM spankchain_ethereum.HumanStandardToken_call_transferFrom
  WHERE
    contract_address = 0x42d6622deCe394b54999Fbd73D108123806f6a18
  GROUP BY
    _from
) AS combined_data
GROUP BY
  address
ORDER BY
  total_value DESC
LIMIT 50