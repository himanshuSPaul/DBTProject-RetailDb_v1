SELECT 
  P.ProductID,
  P.ProductName,
  P.SupplierID,
  S.SupplierName,
  MIN(POD.UnitCost) AS MinUnitCost,
  AVG(POD.UnitCost) AS AvgUnitCost,
  MAX(POD.UnitCost) AS MaxUnitCost,
  SUM(POD.QuantityOrdered) AS TotalOrdered
FROM  {{ ref('BRONZE_PurchaseOrderDetails')}}    POD
JOIN  {{ ref('BRONZE_Products')}}   P 
  ON POD.ProductID = P.ProductID
JOIN  {{ ref('BRONZE_Suppliers')}}   S 
  ON P.SupplierID = S.SupplierID
GROUP BY P.ProductID, P.ProductName, P.SupplierID, S.SupplierName