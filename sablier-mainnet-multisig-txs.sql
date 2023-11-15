--find total amount of ETH the has flown throught the Sablier multisig address
--- mainnet multisig

SELECT
  address AS multisig_address,
  SUM(
    CASE WHEN address = '0x79Fb3e81aAc012c08501f41296CCC145a1E15844' AND "from" <> "to" THEN value ELSE 0 END
  ) AS tokens_out,
  SUM(
    CASE WHEN address = '0x79Fb3e81aAc012c08501f41296CCC145a1E15844' AND "from" <> "to" THEN value ELSE 0 END
  ) AS tokens_in
FROM (
  SELECT "from" AS address, value FROM ethereum.transactions
  WHERE "from" = '0x79Fb3e81aAc012c08501f41296CCC145a1E15844'
  UNION ALL
  SELECT "to" AS address, value FROM ethereum.transactions
  WHERE "to" = '0x79Fb3e81aAc012c08501f41296CCC145a1E15844'
) AS combined
GROUP BY
  address
ORDER BY
  address;