SELECT 
  c.CustomerID,
  c.CustomerName,
  cl.PointsBalance,
  cl.MembershipLevel,
  cs.TotalSales
FROM {{'BRONZE_Customers'}} c
LEFT JOIN {{'BRONZE_CustomerLoyalty'}} cl 
ON c.CustomerID = cl.CustomerID
LEFT JOIN {{'SILVER_CustomerSales'}} cs 
ON c.CustomerID = cs.CustomerID