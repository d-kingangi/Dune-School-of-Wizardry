-- Identify patterns of interaction between addresses, sender-to-receiver relationship

 SELECT
  "from" AS Sender,
  "to" AS Receiver,
  COUNT(*) AS TransactionCount
FROM ethereum.transactions
GROUP BY "from", "to"
HAVING COUNT(*) > 50 
-- Adjust the threshold for defining interaction 
ORDER BY TransactionCount DESC;