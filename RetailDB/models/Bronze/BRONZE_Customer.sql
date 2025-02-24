{{ 
  config(
        tags=["CLARMS"]
        ) 
}}



SELECT
  TRIM(CustomerID) AS CustomerID,
  INITCAP(TRIM(FirstName)) AS FirstName,
  INITCAP(TRIM(LastName)) AS LastName,
  INITCAP(TRIM(FirstName)) || INITCAP(TRIM(LastName)) AS CUSTOMERNAME,
  LOWER(TRIM(Email)) AS Email,
  TRIM(PhoneNumber) AS PhoneNumber,
  TRIM(Address) AS Address,
  INITCAP(TRIM(City)) AS City,
  UPPER(TRIM(State)) AS State,
  TRIM(ZipCode) AS ZipCode,
  UPPER(TRIM(Country)) AS Country
FROM {{ source('RAW_SALES','CUSTOMERS' )}}