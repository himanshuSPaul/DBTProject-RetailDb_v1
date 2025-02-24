
{% macro CALC_COMPOSITE_PRODUCT_SCORE_udf() %}

CREATE OR REPLACE FUNCTION CALC_COMPOSITE_PRODUCT_SCORE(
    margin_percentage DECIMAL, 
    turnover_ratio DECIMAL,
    recommended_reorder DECIMAL
)
RETURNS DECIMAL(10,2)
LANGUAGE SQL
AS
$$
  ROUND((margin_percentage * 0.5) + (turnover_ratio * 0.3) - (recommended_reorder * 0.2), 2)
$$;

{% endmacro %}