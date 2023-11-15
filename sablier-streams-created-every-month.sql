
--total sablier streams created every month

SELECT
  _date,
  COUNT(*) AS streams_created
FROM (
  SELECT
    DATE_TRUNC('month', block_time) AS _date
  FROM ethereum.transaction."Sablier_call_createStream"
) AS total_number_of_streams
GROUP BY
  _date