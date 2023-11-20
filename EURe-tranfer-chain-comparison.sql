WITH PolygonData AS (
  SELECT
    "to" AS addressTo,
    "from" AS addressFrom,
    CAST(value AS DOUBLE) / 1e18 AS valueTransferred
  FROM
    monerium_eure_polygon.EURe_evt_Transfer
),
GnosisData AS (
  SELECT
    "to" AS addressTo,
    "from" AS addressFrom,
    CAST(value AS DOUBLE) / 1e18 AS valueTransferred
  FROM
    monerium_eure_gnosis.EURe_evt_Transfer
),
EthereumData AS (
  SELECT
    "to" AS addressTo,
    "from" AS addressFrom,
    CAST(amount AS DOUBLE) / 1e18 AS valueTransferred
  FROM
    monerium_eure_ethereum.EURe_evt_Transfer
)

SELECT
  'Polygon' AS Chain,
  COUNT(addressTo) AS totalTo,
  COUNT(addressFrom) AS totalFrom,
  SUM(valueTransferred) AS totalValueTransferred
FROM
  PolygonData
UNION ALL
SELECT
  'Gnosis' AS Chain,
  COUNT(addressTo) AS totalTo,
  COUNT(addressFrom) AS totalFrom,
  SUM(valueTransferred) AS totalValueTransferred
FROM
  GnosisData
UNION ALL
SELECT
  'Ethereum' AS Chain,
  COUNT(addressTo) AS totalTo,
  COUNT(addressFrom) AS totalFrom,
  SUM(valueTransferred) AS totalValueTransferred
FROM
  EthereumData;
