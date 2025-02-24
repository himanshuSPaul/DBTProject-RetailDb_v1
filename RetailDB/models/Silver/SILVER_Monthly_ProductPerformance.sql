CREATE OR REPLACE VIEW SILVER_ProductPerformance_Monthly AS
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
FROM BRONZE_Products bp
LEFT JOIN SILVER_ProductSales_Monthly sps
  ON bp.ProductID = sps.ProductID
LEFT JOIN SILVER_ProductPurchases_Monthly spp
  ON bp.ProductID = spp.ProductID
  AND sps.MonthStart = spp.MonthStart
LEFT JOIN SILVER_ProductInventory_Monthly spi
  ON bp.ProductID = spi.ProductID
  AND sps.MonthStart = spi.MonthStart
