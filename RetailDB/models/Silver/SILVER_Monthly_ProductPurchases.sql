SELECT 
  p.ProductID,
  DATE_TRUNC('MONTH', po.OrderDate) AS MonthStart,
  SUM(pod.QuantityOrdered) AS TotalUnitsPurchased,
  SUM(pod.TotalCost) AS TotalPurchaseCost,
  AVG(pod.UnitCost) AS AvgPurchaseCost
FROM BRONZE_PurchaseOrders po
JOIN BRONZE_PurchaseOrderDetails pod 
  ON po.PurchaseOrderID = pod.PurchaseOrderID
JOIN BRONZE_Products p 
  ON pod.ProductID = p.ProductID
GROUP BY p.ProductID, DATE_TRUNC('MONTH', po.OrderDate)