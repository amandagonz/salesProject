SELECT *
FROM sales_records

SELECT DISTINCT Region
FROM sales_records

SELECT COUNT(Order_Id) as num_orders, Region
FROM sales_records
GROUP BY Region
ORDER BY Region DESC

SELECT DISTINCT COUNTRY, Region
FROM sales_records
GROUP BY Region, Country
ORDER BY Region

/*Questions to answer:
1] Best peforming region
2] Worst performing region
3] Best 10 performing countries
4] Worst 10 performing countries
5] Worst performing country in x region
6] Best performing item type
7] Worst performing item type
8] Best peforming year
9] Worst performing year
10]
11]
12]
13]
14]
15]
16]
17]
18]
19]
20]
*/

/*Best peforming region*/
SELECT SUM(Total_Profit) as sum_profit_max, Region
FROM sales_records
GROUP BY Region
ORDER BY sum_profit_max DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

/*Worst performing region*/
SELECT SUM(Total_Profit) as sum_profit_min, Region
FROM sales_records
GROUP BY Region
ORDER BY sum_profit_min
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

/*Best 10 performing countries*/
SELECT SUM(Total_Profit) as sum_profit_max, Country, Region
FROM sales_records
GROUP BY Country, Region
ORDER BY sum_profit_max DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY

/*Worst 10 performing countries*/
SELECT SUM(Total_Profit) as sum_profit_min, Country, Region
FROM sales_records
GROUP BY Country, Region
ORDER BY sum_profit_min
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY

/*Worst performing country in North America*/
SELECT Region, Country, SUM(Total_Profit) as sum_profit_min
FROM sales_records
WHERE Region = 'North America'
GROUP BY Country, Region
ORDER BY sum_profit_min
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

/*Best performing item type*/
SELECT Item_Type, AVG(Total_Profit) as avg_profit
FROM sales_records
GROUP BY Item_Type
ORDER BY avg_profit DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

/*Best peforming year*/
SELECT DATEPART(year, Order_Date) as year_sel, SUM(Total_Profit) as sum_profit
FROM sales_records
GROUP BY DATEPART(year, Order_Date)
ORDER BY sum_profit DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

/*Worst performing year*/
SELECT DATEPART(year, Order_Date) as year_sel, SUM(Total_Profit) as sum_profit
FROM sales_records
GROUP BY DATEPART(year, Order_Date)
ORDER BY sum_profit
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY