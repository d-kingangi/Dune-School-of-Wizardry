WITH daily_users AS (
    SELECT
        block_date,
        tx_from AS user
    FROM
        curvefi.trades
    GROUP BY
        block_date, tx_from
),

first_trades AS (
    SELECT
        tx_from AS user,
        MIN(block_date) AS first_trade_date
    FROM
        curvefi.trades
    GROUP BY
        tx_from
),

daily_stats AS (
    SELECT
        du.block_date,
        COUNT(DISTINCT du.user) AS daily_users,
        COUNT(DISTINCT CASE WHEN du.block_date = ft.first_trade_date THEN du.user END) AS new_users,
        COUNT(DISTINCT CASE WHEN du.block_date > ft.first_trade_date THEN du.user END) AS returning_users
    FROM
        daily_users du
    LEFT JOIN
        first_trades ft ON du.user = ft.user
    GROUP BY
        du.block_date
)

SELECT
    block_date,
    daily_users,
    new_users,
    returning_users
FROM
    daily_stats
ORDER BY
    block_date;
