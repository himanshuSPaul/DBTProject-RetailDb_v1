SELECT 
  CustomerID,
  SUM(TotalAmount) AS TotalSales
FROM BRONZE_Sales
GROUP BY CustomerID