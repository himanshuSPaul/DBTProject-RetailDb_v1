{% macro is_positive_int_udf() %}


    CREATE OR REPLACE FUNCTION {{ target.schema }}.CALC_LOYALTY_EARNED(
        sale_total DECIMAL, 
        membership_level VARCHAR
    )
    RETURNS INT
    LANGUAGE SQL
    AS
    $$
    CASE 
        WHEN UPPER(membership_level) = 'BRONZE' THEN ROUND(sale_total * 0.05)
        WHEN UPPER(membership_level) = 'SILVER' THEN ROUND(sale_total * 0.07)
        WHEN UPPER(membership_level) = 'GOLD' THEN ROUND(sale_total * 0.10)
        WHEN UPPER(membership_level) = 'PLATINUM' THEN ROUND(sale_total * 0.12)
        WHEN UPPER(membership_level) = 'RUBY' THEN ROUND(sale_total * 0.15)
        ELSE 0
    END
    $$;


{% endmacro %}