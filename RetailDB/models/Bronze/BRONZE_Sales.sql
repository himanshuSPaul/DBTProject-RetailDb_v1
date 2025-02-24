{{ 
  config(
        tags=["CLARMS"]
        ) 
}}


SELECT 
  TRIM(SaleID) AS SaleID,
  SaleDate,
  TRIM(StoreID) AS StoreID,
  TRIM(EmployeeID) AS EmployeeID,
  TRIM(CustomerID) AS CustomerID,
  CAST(TotalAmount AS DECIMAL(10,2)) AS TotalAmount,
  PaymentMethod
FROM {{source('RAW_SALES','SALES')}}
WHERE SaleID IS NOT NULL
