--find addresses that have sent and received the largest amount of bridged ETH

SELECT
    'Top Senders' AS transaction_type,
    sender_wallet AS wallet,
    total_sent AS amount
FROM (
    SELECT
        "from" AS sender_wallet,
        SUM(value) AS total_sent
    FROM
        zksync.transactions
    GROUP BY
        "from"
    ORDER BY
        total_sent DESC
    LIMIT 100
) AS TopTransferSenders
UNION ALL
SELECT
    'Top Receivers' AS transaction_type,
    receiver_wallet AS wallet,
    total_received AS amount
FROM (
    SELECT
        "to" AS receiver_wallet,
        SUM(value) AS total_received
    FROM
        zksync.transactions
    GROUP BY
        "to"
    ORDER BY
        total_received DESC
    LIMIT 100
) AS TopTransferReceivers;
