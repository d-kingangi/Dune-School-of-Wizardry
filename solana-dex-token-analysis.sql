WITH base_trades AS (
    SELECT
        DATE_TRUNC('month', block_time) AS month,
        NULL AS token_bought_symbol,
        token_bought_mint_address,
        NULL AS token_sold_symbol,
        token_sold_mint_address,
        SUM(token_bought_amount_raw / 1e18) AS total_token_bought_amount_raw,
        SUM(token_sold_amount_raw / 1e18) AS total_token_sold_amount_raw
    FROM
        dex_solana.base_trades
    GROUP BY
        month,
        token_bought_mint_address,
        token_sold_mint_address
),
trades AS (
    SELECT
        DATE_TRUNC('month', block_time) AS month,
        token_bought_symbol,
        token_bought_mint_address,
        token_sold_symbol,
        token_sold_mint_address,
        SUM(token_bought_amount_raw / 1e18) AS total_token_bought_amount_raw,
        SUM(token_sold_amount_raw / 1e18) AS total_token_sold_amount_raw
    FROM
        dex_solana.trades
    GROUP BY
        month,
        token_bought_symbol,
        token_bought_mint_address,
        token_sold_symbol,
        token_sold_mint_address
)
SELECT
    COALESCE(b.month, t.month) AS month,
    COALESCE(t.token_bought_symbol, NULL) AS token_bought_symbol,
    COALESCE(b.token_bought_mint_address, t.token_bought_mint_address) AS token_bought_mint_address,
    COALESCE(t.token_sold_symbol, NULL) AS token_sold_symbol,
    COALESCE(b.token_sold_mint_address, t.token_sold_mint_address) AS token_sold_mint_address,
    COALESCE(b.total_token_bought_amount_raw, 0) + COALESCE(t.total_token_bought_amount_raw, 0) AS total_token_bought_amount_raw,
    COALESCE(b.total_token_sold_amount_raw, 0) + COALESCE(t.total_token_sold_amount_raw, 0) AS total_token_sold_amount_raw
FROM
    base_trades b
FULL OUTER JOIN
    trades t
ON
    b.month = t.month
    AND b.token_bought_mint_address = t.token_bought_mint_address
    AND b.token_sold_mint_address = t.token_sold_mint_address
ORDER BY
    month,
    token_bought_symbol,
    token_sold_symbol;
