SELECT * FROM drug_sales_transactions;

SELECT * FROM drug_sales_transactions WHERE drugname = 'PREDNISOLONE 5MG';

UPDATE drug_sales_transactions 
SET drugname = 'PREDNISOLONE 5 MG'
WHERE drugname = 'PREDNISOLONE 5MG';

UPDATE drug_sales_transactions 
SET drugname = 'SACUBITRIL 24MG + VALSARTAN 26MG'
WHERE drugname = 'SACUBITRIL24MG+VALSARTAN 26MG';

SELECT * FROM drug_sales_transactions WHERE drugname = 'VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE 15ML DROPS';

UPDATE drug_sales_transactions 
SET drugname = 'VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE 15ML DROPS'
WHERE drugname = 'VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE


VITAMIN B12 + FOLIC ACID + IRON HYDROCHLORIDE 15ML DROPS';



FROM drug_sales_transactions TO 'PREDNISOLONE 5 MG' WHERE drugname = 'PREDNISOLONE 5MG'

SELECT * FROM drug_sales_transactions WHERE drugname ISNULL;

SELECT DISTINCT drugname FROM drug_sales_transactions ORDER BY drugname ASC;

/* Data Summarization */
SELECT
	SubCat, 
	SUM(Quantity) AS Total_Sales_Qty,
	SUM(ReturnQuantity) AS Total_Return_Qty,
	SUM(Final_Cost) AS Total_Final_Cost,
	SUM(Final_Sales) AS Total_Final_Sales,
	SUM(RtnMRP) AS Total_RtnMRP
FROM
	drug_sales_transactions
GROUP BY SubCat
ORDER BY Total_Sales_Qty;



/* Save the Summary to a View */
CREATE VIEW transaction_summary_by_SubCat
as
SELECT
	SubCat, 
	SUM(Quantity) AS Total_Sales_Qty,
	SUM(ReturnQuantity) AS Total_Return_Qty,
	SUM(Final_Cost) AS Total_Final_Cost,
	SUM(Final_Sales) AS Total_Final_Sales,
	SUM(RtnMRP) AS Total_RtnMRP
FROM
	drug_sales_transactions
GROUP BY SubCat
ORDER BY Total_Sales_Qty;

SELECT * FROM transaction_summary_by_SubCat;

/* Save the Summary to a View  for injections dataset*/
CREATE VIEW transaction_summary_by_SubCat1_injections
as
SELECT
	SubCat1, 
	SUM(Quantity) AS Total_Sales_Qty,
	SUM(ReturnQuantity) AS Total_Return_Qty,
	SUM(Final_Cost) AS Total_Final_Cost,
	SUM(Final_Sales) AS Total_Final_Sales,
	SUM(RtnMRP) AS Total_RtnMRP
FROM
	drug_sales_transactions_injections
GROUP BY SubCat1
ORDER BY Total_Sales_Qty;

SELECT * FROM transaction_summary_by_SubCat1_injections;


SELECT * FROM drug_sales_transactions;
/* Removing Injections subcategory from the dataset*/
delete from drug_sales_transactions where subcat='INJECTIONS';

/* Create a new table for Injections subcategory dataset */


/* EDA - Exploratory Data Analysis*/

/* First Moment - Mean NON-INJECTIONS */
SELECT AVG(total_sales_qty) as mean_sales_qty from transaction_summary_by_SubCat;
SELECT AVG(total_return_qty) as mean_return_qty from transaction_summary_by_SubCat;
SELECT AVG(total_final_cost) as mean_final_cost from transaction_summary_by_SubCat;
SELECT AVG(total_final_sales) as mean_final_sales from transaction_summary_by_SubCat;
SELECT AVG(total_rtnmrp) as mean_rtnmrp from transaction_summary_by_SubCat;

/* First Moment - Mean INJECTIONS */
SELECT AVG(total_sales_qty) as mean_sales_qty from transaction_summary_by_SubCat1_injections;
SELECT AVG(total_return_qty) as mean_return_qty from transaction_summary_by_SubCat1_injections;
SELECT AVG(total_final_cost) as mean_final_cost from transaction_summary_by_SubCat1_injections;
SELECT AVG(total_final_sales) as mean_final_sales from transaction_summary_by_SubCat1_injections;
SELECT AVG(total_rtnmrp) as mean_rtnmrp from transaction_summary_by_SubCat1_injections;


/* First Moment - Median Non-Injections */
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_sales_qty) FROM transaction_summary_by_SubCat;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_return_qty) FROM transaction_summary_by_SubCat;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_final_cost) FROM transaction_summary_by_SubCat;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_final_sales) FROM transaction_summary_by_SubCat;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_rtnmrp) FROM transaction_summary_by_SubCat;

/* First Moment - Median Injections */
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_sales_qty) FROM transaction_summary_by_SubCat1_injections;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_return_qty) FROM transaction_summary_by_SubCat1_injections;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_final_cost) FROM transaction_summary_by_SubCat1_injections;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_final_sales) FROM transaction_summary_by_SubCat1_injections;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_rtnmrp) FROM transaction_summary_by_SubCat1_injections;

/* First Moment - Mode */
SELECT
	SubCat, 
	COUNT(Quantity) AS count_per_subCat
FROM
	drug_sales_transactions
GROUP BY SubCat
ORDER BY count_per_subCat DESC
LIMIT 1;

/* Second Moment Decision */
/* Variance */
SELECT variance(total_sales_qty) from transaction_summary_by_subcat;
SELECT variance(total_return_qty) from transaction_summary_by_subcat;
SELECT variance(total_final_cost) from transaction_summary_by_subcat;
SELECT variance(total_final_sales) from transaction_summary_by_subcat;
SELECT variance(total_rtnmrp) from transaction_summary_by_subcat;

/* Standard Deviation */
SELECT ROUND(SQRT(VARIANCE(total_sales_Qty)),2) FROM transaction_summary_by_subcat;
SELECT ROUND(SQRT(VARIANCE(total_return_qty)),2) FROM transaction_summary_by_subcat;
SELECT ROUND(SQRT(VARIANCE(total_final_cost)),2) FROM transaction_summary_by_subcat;
SELECT ROUND(SQRT(VARIANCE(total_final_sales)),2) FROM transaction_summary_by_subcat;
SELECT ROUND(SQRT(VARIANCE(total_rtnmrp)),2) FROM transaction_summary_by_subcat

/* Range */
SELECT MAX(total_sales_Qty) - MIN(total_sales_Qty) AS range_sales_Qty FROM transaction_summary_by_subcat;

/* Compute for Expected value per subcategory*/
/* sub-query to get overall_sales_qty */
SELECT SUM(total_sales_qty) as overall_sales_qty from transaction_summary_by_subcat;
/* Probability of Sales Qty */  
SELECT 
	subcat, 
	total_sales_qty, 
	round(total_sales_qty/
		  (SELECT SUM(total_sales_qty) as overall_sales_qty from transaction_summary_by_subcat),6) 
		  as probability_of_x,
	total_sales_qty* (round(total_sales_qty/
		  (SELECT SUM(total_sales_qty) as overall_sales_qty from transaction_summary_by_subcat),6))
		  as expected_value_of_x
from transaction_summary_by_subcat;

/* First Moment - Median */
SELECT PERCENTILE_CONT(0.95) WITHIN GROUP(ORDER BY total_sales_Qty) FROM transaction_summary_by_SubCat;

/* New Table creation for injections*/
CREATE TABLE drug_sales_transactions_injections (
	Typeofsales VARCHAR(10) NOT NULL,
	Patient_ID VARCHAR(12) NOT NULL,
	Specialisation VARCHAR(16) NOT NULL,
	Dept VARCHAR(12) NOT NULL,
	Dateofbill DATE,
	Quantity INT,
	ReturnQuantity INT,
	Final_Cost NUMERIC,
	Final_Sales NUMERIC, 
	RtnMRP NUMERIC,
	Formulation VARCHAR(6),
	DrugName VARCHAR(200),
	SubCat VARCHAR(30),
	SubCat1 VARCHAR(70)
);

/* Grouping of injections by subcat1 */
SELECT
	SubCat1, 
	SUM(Quantity) AS Total_Sales_Qty,
	SUM(ReturnQuantity) AS Total_Return_Qty,
	SUM(Final_Cost) AS Total_Final_Cost,
	SUM(Final_Sales) AS Total_Final_Sales,
	SUM(RtnMRP) AS Total_RtnMRP
FROM
	drug_sales_transactions_injections
GROUP BY SubCat1
ORDER BY Total_Sales_Qty;


