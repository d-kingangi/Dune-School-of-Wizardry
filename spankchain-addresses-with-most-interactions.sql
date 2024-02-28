SELECT
  address,
  COUNT(*) AS interaction_count
FROM
  (
    SELECT
      "from" AS address
    FROM
      ethereum.transactions
    WHERE
      "from" = 0x42d6622deCe394b54999Fbd73D108123806f6a18
    UNION ALL
    SELECT
      "to" AS address
    FROM
      ethereum.transactions
    WHERE
      "to" = 0x42d6622deCe394b54999Fbd73D108123806f6a18
  ) AS addresses
GROUP BY
  address
ORDER BY
  interaction_count DESC
LIMIT
  50