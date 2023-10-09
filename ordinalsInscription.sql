/* bitcoin ordinal inscriptions */

/* date_trunc('day', block_time) AS DATE. Truncates the block_time column to the day level, group transactions by day.*/
SELECT date_trunc('day', block_time) AS DATE
    /* count(*) AS Daily_Inscriptions. Calculate the count of rows/transactions for each truncated date, to represent daily inscriptions.*/
	,count(*) AS Daily_Inscriptions
    /* sum(count(*)) OVER (ORDER BY date_trunc('day', block_time) RANGE UNBOUNDED PRECEDING) AS Total_Inscriptions 
    Uses a window function to find cumulative sum of daily inscriptions. 
    Adds up the daily inscriptions for all previous days in the result set.*/
	,sum(count(*)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_Inscriptions
    /*calculate the sum of the size column to represent the size of the transaction sum(size) AS Ord_Size_Usage.
    Calculate the sum of the virtual_size column to represent the virtual size of the transaction (used in fee calculations). sum(virtual_size) AS Ord_vSize_Usage. 
    Calculate the sum of the fee column for each truncated date, representing daily transaction fees. sum(fee) AS Daily_fees.
    Calculate the sum of daily fees by adding up the fees for all previous days.sum(sum(fee)) OVER (ORDER BY date_trunc('day', block_time) RANGE UNBOUNDED PRECEDING) AS Total_fees. 
     */
	,sum(size) AS Ord_Size_Usage
	,sum(virtual_size) AS Ord_vSize_Usage
	,sum(fee) AS Daily_fees
	,sum(sum(fee)) OVER (
		ORDER BY date_trunc('day', block_time) range unbounded preceding
		) AS Total_fees
    /* specify the source chain i.e bitcoin*/
    /* WHERE 1 = 1 AND block_height > 767429 AND CAST(hex AS VARCHAR) LIKE '%0063036f726401%': Set conditions to filter the data from the bitcoin.transactions table. 
    Filter by block_height > 767429, hex value '%0063036f726401%'. 
    The '1 = 1' is redundant and can be removed without affecting the query.
    GROUP BY 1: Group the results by the first selected column, which is the truncated date (DATE).
    ORDER BY 1 DESC. Order the results by the truncated date in descending order, effectively sorting the results by date from most recent to oldest.*/
FROM bitcoin.transactions
WHERE 1 = 1
	AND block_height > 767429
	AND cast(hex AS VARCHAR) LIKE '%0063036f726401%'
GROUP BY 1 
ORDER by 1 DESC;dex.trades