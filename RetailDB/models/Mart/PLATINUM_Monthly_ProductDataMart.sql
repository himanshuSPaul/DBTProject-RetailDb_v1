WITH KPIs AS (
  SELECT 
    ProductID,
    ProductName,
    CategoryID,
    SupplierID,
    MonthStart,
    TotalSalesRevenue,
    TotalPurchaseCost,
    TotalMargin,
    MarginPercentage,
    InventoryTurnoverRatio
  FROM GOLD_ProductKPIs_Monthly
),
Ranked AS (
  SELECT 
    ProductID,
    ProductName,
    CategoryID,
    SupplierID,
    MonthStart,
    TotalSalesRevenue,
    TotalPurchaseCost,
    TotalMargin,
    MarginPercentage,
    InventoryTurnoverRatio,
    RANK() OVER (PARTITION BY MonthStart ORDER BY TotalMargin DESC) AS ProfitRank,
    RANK() OVER (PARTITION BY MonthStart ORDER BY InventoryTurnoverRatio DESC) AS TurnoverRank
  FROM KPIs
)
SELECT 
  ProductID,
  ProductName,
  CategoryID,
  SupplierID,
  MonthStart,
  TotalSalesRevenue,
  TotalPurchaseCost,
  TotalMargin,
  MarginPercentage,
  InventoryTurnoverRatio,
  ProfitRank,
  TurnoverRank,
  (ProfitRank + TurnoverRank) AS CompositeRank,
  CASE 
    WHEN (ProfitRank + TurnoverRank) <= 20 THEN 'Star Product'
    WHEN (ProfitRank + TurnoverRank) BETWEEN 21 AND 40 THEN 'Average Performer'
    ELSE 'Underperformer'
  END AS ProductSegment,
  -- Example composite performance index
  ROUND((TotalMargin / NULLIF(TotalPurchaseCost, 0)) * InventoryTurnoverRatio, 2) AS PerformanceIndex
FROM Ranked