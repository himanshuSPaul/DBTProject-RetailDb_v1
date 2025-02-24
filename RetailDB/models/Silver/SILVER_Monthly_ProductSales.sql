--CREATE OR REPLACE VIEW SILVER_ProductSales_Monthly AS
SELECT 
  p.ProductID,
  DATE_TRUNC('MONTH', s.SaleDate) AS MonthStart,
  SUM(sd.Quantity) AS TotalUnitsSold,
  SUM(sd.Subtotal) AS TotalSalesRevenue,
  AVG(sd.UnitPrice) AS AvgSalePrice
FROM {{ref ('BRONZE_Sales')}} s
JOIN {{ref ('BRONZE_SaleDetails')}} sd 
  ON s.SaleID = sd.SaleID
JOIN {{ref ('BRONZE_Products')}} p 
  ON sd.ProductID = p.ProductID
GROUP BY p.ProductID, DATE_TRUNC('MONTH', s.SaleDate)
