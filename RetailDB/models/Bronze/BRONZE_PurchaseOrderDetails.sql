SELECT 
  TRIM(OrderDetailID) AS OrderDetailID,
  TRIM(PurchaseOrderID) AS PurchaseOrderID,
  TRIM(ProductID) AS ProductID,
  CAST(QuantityOrdered AS INT) AS QuantityOrdered,
  CAST(UnitCost AS DECIMAL(10,2)) AS UnitCost,
  CAST(TotalCost AS DECIMAL(10,2)) AS TotalCost
FROM {{source('RAW_PROCUREMENT','PURCHASEORDERDETAILS')}}
--RETAILDB.RAW.PurchaseOrderDetails