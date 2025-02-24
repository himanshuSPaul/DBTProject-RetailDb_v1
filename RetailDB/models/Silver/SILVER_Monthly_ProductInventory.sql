--CREATE OR REPLACE VIEW SILVER_ProductInventory_Monthly AS
SELECT 
  ProductID,
  DATE_TRUNC('MONTH', LastUpdated) AS MonthStart,
  SUM(StockQuantity) AS TotalStock,
  MAX(LastUpdated) AS LastInventoryUpdate
FROM {{ ref('BRONZE_Inventory')}}
GROUP BY ProductID, DATE_TRUNC('MONTH', LastUpdated)
