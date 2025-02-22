SELECT 
  PO.PurchaseOrderID,
  PO.OrderDate,
  PO.Status,
  POD.ProductID,
  P.ProductName,
  P.CategoryID,
  POD.QuantityOrdered,
  POD.UnitCost,
  POD.TotalCost,
  S.SupplierID,
  S.SupplierName,
  S.ContactPerson,
  S.Email AS SupplierEmail
FROM  {{ ref('BRONZE_PurchaseOrders')}} PO
JOIN  {{ ref('BRONZE_PurchaseOrderDetails')}} POD 
  ON PO.PurchaseOrderID = POD.PurchaseOrderID
JOIN  {{ ref('BRONZE_Products')}}  P 
  ON POD.ProductID = P.ProductID
JOIN  {{ ref('BRONZE_Suppliers')}} S 
  ON P.SupplierID = S.SupplierID