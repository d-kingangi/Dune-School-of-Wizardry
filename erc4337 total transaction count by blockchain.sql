
--   blockchain
-- transaction_count

SELECT
  blockchain,
  COUNT(DISTINCT tx_hash) AS transaction_count
FROM
  (
    SELECT
      *
    FROM
      account_abstraction_erc4337_base.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_ethereum.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_polygon.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_optimism.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_arbitrum.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_gnosis.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_bnb.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_avalanche_c.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_celo.userops
  ) AS unified_userops
GROUP BY
  blockchain
ORDER BY
  blockchain



arbitrum
828675
avalanche_c
572503
base
1531588
bnb
89170
celo
668
ethereum
49569
gnosis
116435
optimism
586092
polygon
13636737