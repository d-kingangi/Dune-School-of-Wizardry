WITH project_donations AS (
  SELECT
    project,
    blockchain,
    SUM(amount_raw / 1e18) AS total_amount_raw,
    COUNT(DISTINCT recipient) AS num_recipients,
    COUNT(DISTINCT donor) AS num_donors
  FROM gitcoin.donations
  GROUP BY
    project,
    blockchain
), top_projects AS (
  SELECT
    pd.project,
    pd.blockchain,
    pd.total_amount_raw,
    pd.num_recipients,
    pd.num_donors,
    ROW_NUMBER() OVER (PARTITION BY pd.blockchain ORDER BY pd.total_amount_raw DESC) AS rank_by_amount
  FROM project_donations AS pd
), top_donors AS (
  SELECT
    donor,
    SUM(amount_raw / 1e18) AS total_amount_donated,
    ROW_NUMBER() OVER (ORDER BY SUM(amount_raw / 1e18) DESC) AS rank_by_amount
  FROM gitcoin.donations
  GROUP BY
    donor
)
SELECT
  'Top Projects' AS analysis_type,
  blockchain,
  project,
  total_amount_raw AS total_amount,
  num_recipients,
  num_donors
FROM top_projects
WHERE
  rank_by_amount <= 30
UNION ALL
SELECT
  'Top Donors' AS analysis_type,
  NULL AS blockchain,
  NULL AS project,
  total_amount_donated AS total_amount,
  NULL AS num_recipients,
  NULL AS num_donors
FROM top_donors
WHERE
  rank_by_amount <= 30