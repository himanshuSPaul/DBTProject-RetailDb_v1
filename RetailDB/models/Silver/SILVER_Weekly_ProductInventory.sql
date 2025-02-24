SELECT 
  ProductID,
  DATE_TRUNC('WEEK', LastUpdated) AS WeekStart,
  SUM(StockQuantity) AS TotalStock,
  MAX(LastUpdated) AS LastInventoryUpdate
FROM {{ref ('BRONZE_Inventory')}}
GROUP BY ProductID, DATE_TRUNC('WEEK', LastUpdated)