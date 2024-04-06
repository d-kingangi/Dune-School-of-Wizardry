--query to find the users growth on BASE l2

WITH users AS (
    SELECT
        DATE_TRUNC('day', first_txns) AS time_,
        COUNT(*) AS new_users
    FROM (
        SELECT DISTINCT
            "from",
            MIN(block_time) AS first_txns
        FROM
            base.transactions AS a
        GROUP BY
            1
    ) AS first_txns
    GROUP BY
        1
)

SELECT
    time_,
    new_users AS "new users",
    ROUND(AVG(new_users) OVER (ORDER BY time_ ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)) AS "7d avg",
    SUM(new_users) OVER (ORDER BY time_) AS "total users"
FROM
    users
WHERE
    time_ > DATE '2023-07-12';
