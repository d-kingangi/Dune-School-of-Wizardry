/* bitcoin ordinal inscriptions */
/* truncate the block_time column to the day level, group transactions by day.*/

SELECT date_trunc('day', block_time) AS DATE
    /*find the count of rows/transactions for each truncated date, to represent daily inscriptions.*/
	,count(*) AS Daily_Inscriptions
    /* 
    function to find cumulative sum of daily inscriptions. 
    adds up the daily inscriptions for previous days.*/
	,sum(count(*)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_Inscriptions
    /*sum of size column as Ord_Size_Usage.
    sum of the virtual_size column as Ord_vSize_Usage. 
    sum of the fee column for each truncated date as Daily_Fees
    sum of daily fees by adding up the fees for all previous days as Total_fees. 
     */
	,sum(size) AS Ord_Size_Usage
	,sum(virtual_size) AS Ord_vSize_Usage
	,sum(fee) AS Daily_fees
	,sum(sum(fee)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_fees
    /* specify the source chain i.e bitcoin*/
    /* filter the data from by block height, hex value
    group the results by the first selected column i.e truncated date (DATE).
    order the results by the truncated date in descending order i.e recent to oldest.*/
FROM bitcoin.transactions
WHERE 1 = 1
	AND block_height > 767429
	AND cast(hex AS VARCHAR) LIKE '%0063036f726401%'
GROUP BY 1 
ORDER by 1 DESC;dex.trades
