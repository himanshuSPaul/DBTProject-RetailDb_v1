SELECT 
  SP.SupplierID,
  SP.SupplierName,
  SP.TotalOrders,
  SP.TotalPurchaseCost,
  SP.TotalSalesRevenue,
  SP.TotalInventory,
  SP.InventoryTurnoverRatio,
  (SP.TotalSalesRevenue - SP.TotalPurchaseCost) AS TotalMargin,
  CASE 
    WHEN SP.TotalSalesRevenue = 0 THEN NULL 
    ELSE ROUND((SP.TotalSalesRevenue - SP.TotalPurchaseCost) / SP.TotalSalesRevenue, 2)
  END AS MarginPercentage
FROM {{ ref('GOLD_SupplierPerformance')}}  SP