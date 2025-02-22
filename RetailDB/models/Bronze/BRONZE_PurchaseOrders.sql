SELECT 
  TRIM(PurchaseOrderID) AS PurchaseOrderID,
  TRIM(SupplierID) AS SupplierID,
  OrderDate AS OrderDate,
  INITCAP(TRIM(Status)) AS Status
FROM {{source('RAW_PROCUREMENT','PURCHASEORDERS')}}
WHERE PurchaseOrderID IS NOT NULL