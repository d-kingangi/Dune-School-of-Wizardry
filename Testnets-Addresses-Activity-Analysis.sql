
WITH goerli AS (
  SELECT COUNT(hash) AS total_transactions FROM goerli.transactions 
),
bnb_testnet AS (
  SELECT COUNT(hash) AS total_transactions FROM bnb_testnet.transactions
),
linea_testnet AS (
  SELECT COUNT(hash) AS total_transactions FROM linea.transactions
),
mumbai AS (
  SELECT COUNT(hash) AS total_transactions FROM mumbai.transactions 
),
sepolia AS (
  SELECT COUNT(hash) AS total_transactions FROM sepolia.transactions
),

base_goerli AS (
  SELECT COUNT(hash) AS total_transactions FROM base_goerli.transactions
),
optimism_goerli AS (
  SELECT COUNT(hash) AS total_transactions FROM optimism_goerli.transactions 
)

SELECT 
  'Ethereum Goerli' AS network, goerli.total_transactions
FROM goerli

UNION ALL

SELECT 
  'BNB Testnet', bnb_testnet.total_transactions
FROM bnb_testnet

UNION ALL

SELECT 
  'Linea Testnet', linea_testnet.total_transactions
FROM linea_testnet

UNION ALL

SELECT 
  'Mumbai Testnet', mumbai.total_transactions
FROM mumbai

UNION ALL

SELECT 
  'Sepolia Testnet', sepolia.total_transactions
FROM sepolia

UNION ALL

SELECT 
  'Base Goerli', base_goerli.total_transactions
FROM base_goerli

UNION ALL

SELECT 
  'Optimism Goerli Testnet', optimism_goerli.total_transactions
FROM optimism_goerli;
