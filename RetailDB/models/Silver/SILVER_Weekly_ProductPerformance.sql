SELECT 
  bp.ProductID,
  bp.ProductName,
  bp.CategoryID,
  bp.SupplierID,
  sps.WeekStart,
  sps.TotalUnitsSold,
  sps.TotalSalesRevenue,
  spp.TotalUnitsPurchased,
  spp.TotalPurchaseCost,
  spi.TotalStock
FROM      {{ ref ('BRONZE_Products')}} bp
LEFT JOIN {{ ref ('SILVER_Weekly_ProductSales')}} sps 
       ON bp.ProductID = sps.ProductID
LEFT JOIN {{ ref ('SILVER_Weekly_ProductPurchases')}} spp 
       ON bp.ProductID = spp.ProductID AND sps.WeekStart = spp.WeekStart
LEFT JOIN {{ ref ('SILVER_Weekly_ProductInventory')}} spi 
  ON bp.ProductID = spi.ProductID AND sps.WeekStart = spi.WeekStart