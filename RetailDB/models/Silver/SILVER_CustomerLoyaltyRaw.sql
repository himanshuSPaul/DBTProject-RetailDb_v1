SELECT 
  c.CustomerID,
  c.CustomerName,
  cl.PointsBalance,
  cl.MembershipLevel,
  cs.TotalSales
FROM {{ref('BRONZE_Customer')}} c
LEFT JOIN {{ref('BRONZE_CustomerLoyalty')}} cl 
ON c.CustomerID = cl.CustomerID
LEFT JOIN {{ref('SILVER_CustomerSales')}} cs 
ON c.CustomerID = cs.CustomerID