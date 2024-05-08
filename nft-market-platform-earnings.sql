Marketplace

block_date

Total_Fee_Raw

Total_Fee

Total_Fee_USD

Average_Fee_Percentage
WITH daily_fees AS (
  SELECT
    'OpenSea' AS Marketplace,
    TRY_CAST(block_date AS VARCHAR) AS block_date,
    SUM(platform_fee_amount_raw) AS Total_Fee_Raw,
    SUM(platform_fee_amount) AS Total_Fee,
    SUM(platform_fee_amount_usd) AS Total_Fee_USD,
    AVG(platform_fee_percentage) AS Average_Fee_Percentage
  FROM opensea.trades
  GROUP BY
    2
  UNION ALL
  SELECT
    'Magic Eden',
    TRY_CAST(block_date AS VARCHAR) AS block_date,
    SUM(platform_fee_amount_raw),
    SUM(platform_fee_amount),
    SUM(platform_fee_amount_usd),
    AVG(platform_fee_percentage)
  FROM magiceden.trades
  GROUP BY
    2
  UNION ALL
  SELECT
    'Rarible',
    TRY_CAST(block_date AS VARCHAR) AS block_date,
    SUM(platform_fee_amount_raw),
    SUM(platform_fee_amount),
    SUM(platform_fee_amount_usd),
    AVG(platform_fee_percentage)
  FROM rarible.trades
  GROUP BY
    2
  UNION ALL
  SELECT
    'SuperRare',
    TRY_CAST(block_date AS VARCHAR) AS block_date,
    SUM(platform_fee_amount_raw),
    SUM(platform_fee_amount),
    SUM(platform_fee_amount_usd),
    AVG(platform_fee_percentage)
  FROM superrare.trades
  GROUP BY
    2
  UNION ALL
  SELECT
    'Foundation',
    TRY_CAST(block_date AS VARCHAR) AS block_date,
    SUM(platform_fee_amount_raw),
    SUM(platform_fee_amount),
    SUM(platform_fee_amount_usd),
    AVG(platform_fee_percentage)
  FROM foundation.trades
  GROUP BY
    2
), total_fees AS (
  SELECT
    Marketplace,
    SUM(Total_Fee_Raw) AS Total_Fee_Raw_Sum,
    SUM(Total_Fee) AS Total_Fee_Double_Sum,
    SUM(Total_Fee_USD) AS Total_Fee_USD_Sum
  FROM daily_fees
  GROUP BY
    Marketplace
)
SELECT
  *
FROM daily_fees
UNION ALL
SELECT
  Marketplace,
  'Total',
  Total_Fee_Raw_Sum,
  Total_Fee_Double_Sum,
  Total_Fee_USD_Sum,
  NULL AS Average_Fee_Percentage
FROM total_fees