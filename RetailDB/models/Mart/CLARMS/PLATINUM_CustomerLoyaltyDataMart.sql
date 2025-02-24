{{ 
  config(
        tags=["CLARMS"]
        ) 
}}

--CREATE OR REPLACE TABLE PLATINUM_CustomerLoyaltyDataMart AS
WITH Updated AS (
  SELECT 
    CustomerID,
    NewPoints,
    NewMembershipLevel
  FROM {{ ref('GOLD_CustomerLoyaltyUpdate')}}
),
Ranked AS (
  SELECT 
    CustomerID,
    NewPoints,
    NewMembershipLevel,
    RANK() OVER (ORDER BY NewPoints DESC) AS LoyaltyRank,
    CASE 
      WHEN NewPoints >= 500 THEN 'Top Tier'
      WHEN NewPoints >= 300 THEN 'Mid Tier'
      ELSE 'Standard'
    END AS LoyaltySegment
  FROM Updated
)
SELECT 
  CustomerID,
  NewPoints AS TotalPoints,
  NewMembershipLevel AS FinalMembershipLevel,
  LoyaltyRank,
  LoyaltySegment,
  -- For example, a composite loyalty index can be calculated as a function of points and rank:
  ROUND(NewPoints / NULLIF(LoyaltyRank, 0), 2) AS LoyaltyIndex
FROM Ranked
