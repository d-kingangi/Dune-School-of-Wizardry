-- bitcoin ordinal inscriptions 

SELECT date_trunc('day', block_time) AS DATE
	,count(*) AS Daily_Inscriptions

	,sum(count(*)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_Inscriptions
    sum of the virtual_size column as Ord_vSize_Usage. 
    sum of the fee column for each truncated date as Daily_Fees
    sum of daily fees by adding up the fees for all previous days as Total_fees. 
     
	,sum(size) AS Ord_Size_Usage
	,sum(virtual_size) AS Ord_vSize_Usage
	,sum(fee) AS Daily_fees
	,sum(sum(fee)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_fees
    group the results by the first selected column i.e truncated date (DATE).
    order the results by the truncated date in descending order i.e recent to oldest.*/
FROM bitcoin.transactions
WHERE 1 = 1
	AND block_height > 767429
	AND cast(hex AS VARCHAR) LIKE '%0063036f726401%'
GROUP BY 1 
ORDER by 1 DESC;dex.trades
