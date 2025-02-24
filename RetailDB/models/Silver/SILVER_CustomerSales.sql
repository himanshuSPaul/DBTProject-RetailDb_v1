SELECT 
  CustomerID,
  SUM(TotalAmount) AS TotalSales
FROM {{ref('BRONZE_Sales')}}
GROUP BY CustomerID