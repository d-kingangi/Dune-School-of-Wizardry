-- comparing the different version of Gitcoin

SELECT 
    version,
    COUNT(DISTINCT recipient) AS num_recipients,
    SUM(amount_raw / 1e18) AS total_amount_received,
    SUM(amount_original) AS total_amount_original,
    COUNT(DISTINCT donor) AS num_donors
FROM 
    gitcoin.donations
GROUP BY 
    version;


--apparently the has only been 1 version of Gitcoin


-- version
-- num_recipients
-- total_amount_received
-- total_amount_original
-- num_donors

-- v1
-- 3057
-- 330654622.8916788
-- 333098433.7273957
-- 109841