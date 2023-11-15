-- total cancelled streams for the Sablier Protocol
-- for Polygon, Ethereum, Arbitrum


SELECT
  COUNT(*)
FROM
  (
    SELECT
      *
    FROM
      sablier_v2_0_polygon."SablierV2LockupLinear_evt_CancelLockupStream"
    UNION ALL
    SELECT
      *
    FROM
      sablier_v2_0_polygon."SablierV2LockupDynamic_evt_CancelLockupStream"
    SELECT
      *
    FROM
      sablier_v2_0_ethereum."SablierV2LockupLinear_evt_CancelLockupStream"
    UNION ALL
    SELECT
      *
    FROM
      sablier_v2_0_ethereum."SablierV2LockupDynamic_evt_CancelLockupStream"
    UNION ALL
    SELECT
      *
    FROM
      sablier_v2_0_arbitrum."SablierV2LockupLinear_evt_CancelLockupStream"
    UNION ALL
    SELECT
      *
    FROM
      sablier_v2_0_arbitrum."SablierV2LockupDynamic_evt_CancelLockupStream"
    UNION ALL
  )