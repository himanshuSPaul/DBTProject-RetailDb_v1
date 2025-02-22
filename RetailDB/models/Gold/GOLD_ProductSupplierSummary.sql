SELECT 
  P.ProductID,
  P.ProductName,
  P.SupplierID,
  S.SupplierName,
  COUNT(DISTINCT PO.PurchaseOrderID) AS PurchaseOrderCount,
  SUM(POD.QuantityOrdered) AS TotalPurchased,
  AVG(POD.UnitCost) AS AvgPurchaseCost,
  COUNT(DISTINCT SA.SaleID) AS SalesCount,
  SUM(SD.Quantity) AS TotalSold,
  AVG(SD.UnitPrice) AS AvgSalePrice,
  SUM(SD.Subtotal) AS TotalSalesRevenue
FROM {{ ref('BRONZE_Products')}}    P
JOIN {{ ref('BRONZE_Suppliers')}}    S 
  ON P.SupplierID = S.SupplierID
LEFT JOIN {{ ref('BRONZE_PurchaseOrderDetails')}}    POD 
  ON P.ProductID = POD.ProductID
LEFT JOIN {{ ref('BRONZE_PurchaseOrders')}}   PO 
  ON POD.PurchaseOrderID = PO.PurchaseOrderID
LEFT JOIN {{ ref('BRONZE_SaleDetails')}}   SD 
  ON P.ProductID = SD.ProductID
LEFT JOIN {{ ref('BRONZE_Sales')}}   SA 
  ON SD.SaleID = SA.SaleID
GROUP BY P.ProductID, P.ProductName, P.SupplierID, S.SupplierName