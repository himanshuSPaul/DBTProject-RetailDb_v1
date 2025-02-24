--CREATE OR REPLACE VIEW SILVER_ProductPerformance_Monthly AS
SELECT 
  bp.ProductID,
  bp.ProductName,
  bp.CategoryID,
  bp.SupplierID,
  sps.MonthStart,
  sps.TotalUnitsSold,
  sps.TotalSalesRevenue,
  spp.TotalUnitsPurchased,
  spp.TotalPurchaseCost,
  spi.TotalStock
FROM {{ ref ('BRONZE_Products')}} bp
LEFT JOIN {{ ref('SILVER_Monthly_ProductSales')}} sps
  ON bp.ProductID = sps.ProductID
LEFT JOIN {{ ref('SILVER_Monthly_ProductPurchases')}} spp
  ON bp.ProductID = spp.ProductID
  AND sps.MonthStart = spp.MonthStart
LEFT JOIN {{ ref('SILVER_Monthly_ProductInventory')}} spi
  ON bp.ProductID = spi.ProductID
  AND sps.MonthStart = spi.MonthStart
