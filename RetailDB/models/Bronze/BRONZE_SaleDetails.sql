SELECT 
  TRIM(SaleDetailID) AS SaleDetailID,
  TRIM(SaleID) AS SaleID,
  TRIM(ProductID) AS ProductID,
  CAST(Quantity AS INT) AS Quantity,
  CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice,
  CAST(Subtotal AS DECIMAL(10,2)) AS Subtotal
FROM {{source('RAW_SALES','SALEDETAILS')}}