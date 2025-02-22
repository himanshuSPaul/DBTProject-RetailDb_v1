SELECT 
  TRIM(InventoryID) AS InventoryID
  ,TRIM(StoreID) AS StoreID
  ,TRIM(ProductID) AS ProductID
  ,CAST(StockQuantity AS INT) AS StockQuantity
  ,LastUpdated
FROM  {{ source('RAW_PRODUCTS','INVENTORY' )}}
--RETAILDB.RAW.Inventory;