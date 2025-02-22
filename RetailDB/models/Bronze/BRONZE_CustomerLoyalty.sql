SELECT 
  TRIM('LOY_' || LPAD(TO_VARCHAR(ROW_NUMBER() OVER (ORDER BY CustomerID)), 3, '0')) AS LoyaltyID,
  CustomerID,
  0 AS PointsBalance,
  CURRENT_DATE AS LastUpdated,
  'Bronze' AS MembershipLevel
FROM {{ ref('BRONZE_Customer')}} --Customers