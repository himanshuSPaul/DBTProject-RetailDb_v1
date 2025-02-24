SELECT 
  ppm.ProductID,
  ppm.ProductName,
  ppm.CategoryID,
  ppm.SupplierID,
  ppm.MonthStart,
  COALESCE(ppm.TotalSalesRevenue, 0) AS TotalSalesRevenue,
  COALESCE(ppm.TotalPurchaseCost, 0) AS TotalPurchaseCost,
  (COALESCE(ppm.TotalSalesRevenue, 0) - COALESCE(ppm.TotalPurchaseCost, 0)) AS TotalMargin,
  CASE 
    WHEN COALESCE(ppm.TotalSalesRevenue, 0) = 0 THEN 0
    ELSE ROUND(((COALESCE(ppm.TotalSalesRevenue, 0) - COALESCE(ppm.TotalPurchaseCost, 0)) / COALESCE(ppm.TotalSalesRevenue, 0)) * 100, 2)
  END AS MarginPercentage,
  CASE 
    WHEN COALESCE(ppm.TotalStock, 0) = 0 THEN NULL
    ELSE ROUND(COALESCE(ppm.TotalSalesRevenue, 0) / ppm.TotalStock, 2)
  END AS InventoryTurnoverRatio
FROM SILVER_Monthly_ProductPerformance ppm