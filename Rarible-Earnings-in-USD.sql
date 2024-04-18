--find the total amount in USD that Rarible has earned from sale of NFT on the platform

SELECT
    SUM(platform_fee_amount_usd) AS total_platform_earnings_usd
FROM
    rarible.trades;


-- total_platform_earnings_usd
-- 723681.1512490113