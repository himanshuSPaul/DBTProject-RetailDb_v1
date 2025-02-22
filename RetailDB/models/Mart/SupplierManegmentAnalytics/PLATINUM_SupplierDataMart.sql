WITH SupplierData AS (
  SELECT 
    KPI.SupplierID,
    KPI.SupplierName,
    KPI.TotalOrders,
    KPI.TotalPurchaseCost,
    KPI.TotalSalesRevenue,
    KPI.TotalMargin,
    KPI.MarginPercentage,
    KPI.InventoryTurnoverRatio,
    RANK() OVER (ORDER BY KPI.MarginPercentage DESC) AS MarginRank,
    RANK() OVER (ORDER BY KPI.InventoryTurnoverRatio DESC) AS TurnoverRank,
    -- A simple composite rank: lower rank numbers indicate better performance.
    (RANK() OVER (ORDER BY KPI.MarginPercentage DESC) + RANK() OVER (ORDER BY KPI.InventoryTurnoverRatio DESC)) / 2.0 AS CompositeRank
  FROM {{ ref ('GOLD_SupplierKPIs')}}  KPI
)
SELECT 
  SupplierID,
  SupplierName,
  TotalOrders,
  TotalPurchaseCost,
  TotalSalesRevenue,
  TotalMargin,
  MarginPercentage,
  InventoryTurnoverRatio,
  MarginRank,
  TurnoverRank,
  CompositeRank,
  CASE 
    WHEN CompositeRank <= 3 THEN 'High Performance'
    WHEN CompositeRank <= 6 THEN 'Medium Performance'
    ELSE 'Low Performance'
  END AS PerformanceCategory,
  -- Additional transformation: Calculate a supplier performance index.
  ROUND((TotalMargin / NULLIF(TotalPurchaseCost, 0)) * InventoryTurnoverRatio, 2) AS PerformanceIndex
FROM SupplierData