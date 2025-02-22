SELECT 
  TRIM(ProductID) AS ProductID,
  INITCAP(TRIM(ProductName)) AS ProductName,
  TRIM(CategoryID) AS CategoryID,
  TRIM(SupplierID) AS SupplierID,
  CAST(Price AS DECIMAL(10,2)) AS Price,
  CAST(Cost AS DECIMAL(10,2)) AS Cost,
  COALESCE(StockQuantity, 0) AS StockQuantity,
  IsActive
FROM {{source('RAW_PRODUCTS','PRODUCTS')}}
--RETAILDB.RAW.Products