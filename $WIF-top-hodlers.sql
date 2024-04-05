--find top hodlers of the $WIF memecoins

SELECT DISTINCT
  item.owner,
  FIRST_VALUE(item.amount) OVER (
    PARTITION BY
      item.account
    ORDER BY
      block_slot DESC
  ) AS token_balance
FROM
  (
    SELECT
      block_slot,
      post_token_balances
    FROM
      solana.transactions
    WHERE
      block_date > CAST('2023-11-20' AS DATE) 
      AND CONTAINS(
        account_keys,
        'Vote111111111111111111111111111111111111111'
      ) = FALSE 
      AND CONTAINS(
        account_keys,
        'EKpQGSJtjMFqKZ9KQanSqYXRcF8fBopzLHYxdM65zcjm' /* $BONK mint address */
      ) = TRUE
      AND success = TRUE
  )
  CROSS JOIN UNNEST (post_token_balances) AS item
WHERE
  item.mint = 'EKpQGSJtjMFqKZ9KQanSqYXRcF8fBopzLHYxdM65zcjm'
ORDER BY
  token_balance DESC
LIMIT
  500