---------------------------------------------------------------------------
---------------------------# DEV DBT USER SET UP #-------------------------
---------------------------------------------------------------------------
CREATE ROLE IF NOT EXISTS EDW_DEV_ETL_ROLE;
GRANT ROLE EDW_DEV_ETL_ROLE TO ROLE ACCOUNTADMIN;
CREATE WAREHOUSE IF NOT EXISTS EDW_DEV_ETL_WH;
GRANT OPERATE ON WAREHOUSE EDW_DEV_ETL_WH TO ROLE EDW_DEV_ETL_ROLE;
CREATE USER IF NOT EXISTS EDW_DEV_ETL_DBT_USER  PASSWORD='dbtPassword123'  LOGIN_NAME='EDW_DEV_ETL_DBT_USER'  MUST_CHANGE_PASSWORD=FALSE  DEFAULT_WAREHOUSE='EDW_DEV_ETL_WH'  DEFAULT_ROLE=EDW_DEV_ETL_ROLE  DEFAULT_NAMESPACE='RETAILDB_DEV.PUBLIC'  COMMENT='DBT user used for data ETL transformation';
GRANT ROLE EDW_DEV_ETL_ROLE to USER EDW_DEV_ETL_DBT_USER;
GRANT ALL ON WAREHOUSE EDW_DEV_ETL_WH TO ROLE EDW_DEV_ETL_ROLE;
GRANT ALL ON DATABASE RETAILDB_DEV to ROLE EDW_DEV_ETL_ROLE;
GRANT ALL ON ALL SCHEMAS IN DATABASE RETAILDB_DEV to ROLE EDW_DEV_ETL_ROLE ;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE RETAILDB_DEV to ROLE EDW_DEV_ETL_ROLE ;
GRANT ALL ON ALL TABLES IN SCHEMA RETAILDB_DEV.PUBLIC to ROLE EDW_DEV_ETL_ROLE ;
GRANT ALL ON FUTURE TABLES IN SCHEMA RETAILDB_DEV.PUBLIC to ROLE EDW_DEV_ETL_ROLE ;


GRANT ALL ON ALL TABLES IN DATABASE RETAILDB_DEV to ROLE EDW_DEV_ETL_ROLE ;
