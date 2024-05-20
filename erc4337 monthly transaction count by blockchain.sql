-- blockchain
-- block_month
-- transaction_count

SELECT
  blockchain,
  block_month,
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
  blockchain,
  block_month
ORDER BY
  blockchain,
  block_month;