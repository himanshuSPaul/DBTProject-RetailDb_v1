SELECT 
  I.InventoryID,
  I.StoreID,
  I.ProductID,
  P.ProductName,
  P.SupplierID,
  S.SupplierName,
  I.StockQuantity,
  I.LastUpdated
FROM  {{ ref('BRONZE_Inventory')}}  I
JOIN  {{ ref('BRONZE_Products')}} P 
  ON I.ProductID = P.ProductID
JOIN  {{ ref('BRONZE_Suppliers')}} S 
  ON P.SupplierID = S.SupplierID