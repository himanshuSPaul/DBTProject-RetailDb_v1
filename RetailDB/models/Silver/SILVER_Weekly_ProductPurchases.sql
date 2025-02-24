SELECT 
  p.ProductID,
  DATE_TRUNC('WEEK', po.OrderDate) AS WeekStart,
  SUM(pod.QuantityOrdered) AS TotalUnitsPurchased,
  SUM(pod.TotalCost) AS TotalPurchaseCost,
  AVG(pod.UnitCost) AS AvgPurchaseCost
FROM {{ref ('BRONZE_PurchaseOrders')}} po
JOIN {{ref ('BRONZE_PurchaseOrderDetails')}} pod 
  ON po.PurchaseOrderID = pod.PurchaseOrderID
JOIN {{ref ('BRONZE_Products')}} p 
  ON pod.ProductID = p.ProductID
GROUP BY p.ProductID, DATE_TRUNC('WEEK', po.OrderDate)