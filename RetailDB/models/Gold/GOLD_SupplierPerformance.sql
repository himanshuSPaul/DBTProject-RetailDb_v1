{{ 
  config  (
          enabled= true
          ) 
  }}

SELECT 
  S.SupplierID,
  S.SupplierName,
  COUNT(DISTINCT SO.PurchaseOrderID) AS TotalOrders,
  SUM(SO.TotalCost) AS TotalPurchaseCost,
  SUM(SS.Subtotal) AS TotalSalesRevenue,
  SUM(Inv.StockQuantity) AS TotalInventory,
  CASE 
    WHEN SUM(Inv.StockQuantity) = 0 THEN NULL 
    ELSE ROUND(SUM(SS.Subtotal) / SUM(Inv.StockQuantity), 2)
  END AS InventoryTurnoverRatio
FROM {{ ref('BRONZE_Suppliers')}}    S
LEFT JOIN {{ ref('SILVER_SupplierOrders')}}    SO 
  ON S.SupplierID = SO.SupplierID
LEFT JOIN {{ ref('SILVER_SupplierSales')}}    SS 
  ON S.SupplierID = SS.SupplierID
LEFT JOIN {{ ref('BRONZE_Products')}} P 
  ON P.SupplierID = S.SupplierID
LEFT JOIN {{ ref('BRONZE_Inventory')}} Inv
  ON P.ProductID= Inv.ProductID  
-- LEFT JOIN {{ ref('BRONZE_Inventory')}}    Inv 
--   ON Inv.ProductID IN (SELECT ProductID FROM {{ ref('BRONZE_Products')}}  WHERE SupplierID = S.SupplierID)
GROUP BY S.SupplierID, S.SupplierName