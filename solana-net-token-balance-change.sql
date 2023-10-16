/*  query calculates the net token balance change for each account over time and identifies accounts with substantial token activity. */

WITH AccountBalances AS (
    SELECT
        address,
        block_date,
        SUM(token_balance_change) AS net_token_balance_change
    FROM solana.account_activity
    GROUP BY address, block_date
),
RankedBalances AS (
    SELECT
        address,
        block_date,
        net_token_balance_change,
        ROW_NUMBER() OVER(PARTITION BY address ORDER BY block_date) AS rn
    FROM AccountBalances
),
AccountActivity AS (
    SELECT
        rb1.address AS address,
        rb1.block_date AS start_date,
        rb2.block_date AS end_date,
        rb1.net_token_balance_change AS start_balance,
        rb2.net_token_balance_change AS end_balance,
        rb2.net_token_balance_change - rb1.net_token_balance_change AS balance_change
    FROM RankedBalances rb1
    JOIN RankedBalances rb2 ON rb1.address = rb2.address AND rb1.rn = rb2.rn - 1
),
ActiveAccounts AS (
    SELECT
        address,
        start_date,
        end_date,
        start_balance,
        end_balance,
        balance_change
    FROM AccountActivity
    WHERE balance_change > 100000
)
SELECT
    address,
    start_date,
    end_date,
    start_balance,
    end_balance,
    balance_change
FROM ActiveAccounts
ORDER BY balance_change DESC;