SELECT
  *,
  (
    balance / supply
  ) AS pct_of_supply
FROM (
  SELECT
    token_balance_owner AS current_holders,
    SUM(token_balance) AS balance,
    SUM(SUM(token_balance)) OVER () AS supply
  FROM solana_utils.latest_balances
  WHERE
    1 = 1
    AND token_mint_address = '3S8qX1MsMqRbiwKg2cQyx7nis1oHMgaCuc9c4VfvVdPN'
    AND token_balance <> 0
  GROUP BY
    token_balance_owner
)
ORDER BY
  balance DESC