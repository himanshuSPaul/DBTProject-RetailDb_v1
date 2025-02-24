{{ 
  config(
        tags=["CLARMS"]
        ) 
}}

WITH Earned AS (
  SELECT 
    cl.CustomerID,
    cl.PointsBalance AS OldPoints,
    cl.MembershipLevel,
    cs.TotalSales,
    CALC_LOYALTY_EARNED(cs.TotalSales, cl.MembershipLevel) AS EarnedPoints
  FROM {{ ref('BRONZE_CustomerLoyalty')}} cl
  LEFT JOIN {{ ref('SILVER_CustomerSales')}} cs 
  ON cl.CustomerID = cs.CustomerID
)
SELECT
  CustomerID,
  OldPoints,
  EarnedPoints,
  (OldPoints + COALESCE(EarnedPoints, 0)) AS NewPoints,
  CASE 
    WHEN (OldPoints + COALESCE(EarnedPoints, 0)) BETWEEN 50 AND 100 THEN 'Bronze'
    WHEN (OldPoints + COALESCE(EarnedPoints, 0)) BETWEEN 101 AND 200 THEN 'Silver'
    WHEN (OldPoints + COALESCE(EarnedPoints, 0)) BETWEEN 201 AND 300 THEN 'Gold'
    WHEN (OldPoints + COALESCE(EarnedPoints, 0)) BETWEEN 301 AND 400 THEN 'Platinum'
    WHEN (OldPoints + COALESCE(EarnedPoints, 0)) >= 401 THEN 'Ruby'
    ELSE 'Bronze'
  END AS NewMembershipLevel
FROM Earned