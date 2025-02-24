WITH KPI AS (
  SELECT 
    ProductID,
    ProductName,
    CategoryID,
    SupplierID,
    WeekStart,
    TotalSalesRevenue,
    TotalPurchaseCost,
    TotalMargin,
    MarginPercentage,
    InventoryTurnoverRatio
  FROM {{ref('GOLD_Weekly_ProductKPIs')}}
),
Ranked AS (
  SELECT 
    ProductID,
    ProductName,
    CategoryID,
    SupplierID,
    WeekStart,
    TotalSalesRevenue,
    TotalPurchaseCost,
    TotalMargin,
    MarginPercentage,
    InventoryTurnoverRatio,
    RANK() OVER (PARTITION BY WeekStart ORDER BY TotalMargin DESC) AS ProfitRank,
    RANK() OVER (PARTITION BY WeekStart ORDER BY InventoryTurnoverRatio DESC) AS TurnoverRank
  FROM KPI
)
SELECT 
  ProductID,
  ProductName,
  CategoryID,
  SupplierID,
  WeekStart,
  TotalSalesRevenue,
  TotalPurchaseCost,
  TotalMargin,
  MarginPercentage,
  InventoryTurnoverRatio,
  ProfitRank,
  TurnoverRank,
  (ProfitRank + TurnoverRank) AS CompositeRank,
  CASE 
    WHEN (ProfitRank + TurnoverRank) <= 10 THEN 'Star Product'
    WHEN (ProfitRank + TurnoverRank) BETWEEN 11 AND 20 THEN 'Average Performer'
    ELSE 'Underperformer'
  END AS ProductSegment,
  -- Use UDF to compute a composite score.
  CALC_COMPOSITE_PRODUCT_SCORE(MarginPercentage, InventoryTurnoverRatio, 30) AS CompositePerformanceScore
FROM Ranked
ORDER BY WeekStart, CompositePerformanceScore DESC