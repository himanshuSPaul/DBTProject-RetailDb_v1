SELECT 
  S.SaleID,
  S.SaleDate,
  SD.ProductID,
  P.ProductName,
  P.SupplierID,
  SLP.SupplierName,
  SD.Quantity,
  SD.UnitPrice,
  SD.Subtotal
FROM {{ ref('BRONZE_Sales')}}  S
JOIN {{ ref('BRONZE_SaleDetails')}}  SD 
  ON S.SaleID = SD.SaleID
JOIN {{ ref('BRONZE_Products')}}  P 
  ON SD.ProductID = P.ProductID
JOIN {{ ref('BRONZE_Suppliers')}}  SLP 
  ON P.SupplierID = SLP.SupplierID