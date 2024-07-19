

-- time
-- users
-- new_users
-- existing_users
-- total_users

SELECT
  DATE_TRUNC('day', evt_block_time) AS time,
  COUNT(DISTINCT address) AS users,
  SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END) AS new_users,
  COUNT(DISTINCT address) - SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END) AS existing_users,
  SUM(SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END)) OVER (ORDER BY DATE_TRUNC('day', evt_block_time)) AS total_users
FROM (
  SELECT
    evt_block_time,
    address,
    ROW_NUMBER() OVER (PARTITION BY address ORDER BY evt_block_time) AS row_num
  FROM (
    SELECT
      evt_block_time,
      "from" AS address
    FROM evms.erc20_transfers
    WHERE
      contract_address = 0x582d872a1b094fc48f5de31d3b73f2d9be47def1
    UNION ALL
    SELECT
      evt_block_time,
      "to" AS address
    FROM evms.erc20_transfers
    WHERE
      contract_address = 0x582d872a1b094fc48f5de31d3b73f2d9be47def1
  ) AS transfers
)
WHERE
  evt_block_time >= CURRENT_DATE - INTERVAL '2' year
GROUP BY
  1