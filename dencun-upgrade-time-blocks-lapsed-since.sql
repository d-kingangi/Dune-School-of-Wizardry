-- time and blocks lapsed since the Dencun upgrade - Ethereum layer 1

SELECT
  (8626176 - MAX(slot)) * -1 
  AS 
  blocks_since_Dencun,
  (TRY_CAST
  ('2024-03-13 13:55:35' AS TIMESTAMP) --DENCUN upgrade timestamp
  - MAX(time)
  ) * -1 
  AS 
  time_since_Dencun
FROM beacon.blocks


-- blocks_since_Dencun
-- 78272

-- time_since_Dencun
-- 10 20:54:24.000