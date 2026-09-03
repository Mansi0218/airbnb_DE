{% set congigs = [
    {
        "table": "AIRBNB.GOLD.obt",
        "columns": "gold_obt.BOOKING_ID, gold_obt.HOST_ID, gold_obt.LISTING_ID, gold_obt.TOTAL_BOOKING_AMOUNT, gold_obt.SERVICE_FEE, gold_obt.CLEANING_FEE, gold_obt.ACCOMMODATES, gold_obt.BATHROOMS, gold_obt.BEDROOMS, gold_obt.PRICE_PER_NIGHT, gold_obt.RESPONSE_RATE",
        "alias": "gold_obt"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "dim_listings",
        "join_conditions": "gold_obt.listing_id = dim_listings.listing_id"
    },
    {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "columns": "",
        "alias": "dim_hosts",
        "join_conditions": "gold_obt.host_id = dim_hosts.host_id"
    }
] %}

SELECT 
        {{ congigs[0]['columns'] }}
FROM
    {% for config in congigs %}
    {%if loop.first %}
        {{config['table']}} AS {{config['alias']}}
    {%else%}
        LEFT JOIN {{config['table']}} AS {{config['alias']}}
        ON {{config['join_conditions']}}
    {% endif %}
    {% endfor %}