SELECT 
  TRIM(SupplierID) AS SupplierID,
  INITCAP(TRIM(SupplierName)) AS SupplierName,
  INITCAP(TRIM(ContactPerson)) AS ContactPerson,
  LOWER(TRIM(Email)) AS Email,
  TRIM(ContactNumber) AS ContactNumber,
  TRIM(Address) AS Address
FROM {{ source('RAW_PROCUREMENT','SUPPLIERS') }}
--RETAILDB.RAW.Suppliers
WHERE SupplierID IS NOT NULL