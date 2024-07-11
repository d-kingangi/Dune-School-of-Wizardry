--find monthly active addresses on the gnosis chain over the past 1095 days

SELECT
  date_trunc('month', block_time) AS month,
  COUNT(DISTINCT "from") AS total
FROM gnosis.transactions
WHERE block_time > CURRENT_TIMESTAMP - INTERVAL '1095 day'
GROUP BY 1
ORDER BY 1 DESC;
