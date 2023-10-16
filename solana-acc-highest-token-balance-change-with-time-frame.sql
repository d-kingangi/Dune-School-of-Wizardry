-- query to find the top accounts with the highest token balance changes within specific time frames

WITH BalanceChanges AS (
    SELECT
        address,
        block_date,
        SUM(token_balance_change) AS total_balance_change
    FROM solana.account_activity
    GROUP BY address, block_date
),
RankedAccounts AS (
    SELECT
        address,
        block_date,
        total_balance_change,
        ROW_NUMBER() OVER (PARTITION BY block_date ORDER BY total_balance_change DESC) AS rank
    FROM BalanceChanges
),
TopAccounts AS (
    SELECT
        address,
        block_date,
        total_balance_change
    FROM RankedAccounts
    WHERE rank <= 112 -- Select the top ? accounts with the highest balance change
)
SELECT
    address,
    block_date,
    total_balance_change
FROM TopAccounts
ORDER BY block_date, total_balance_change DESC;
