

SELECT 
        gold_obt.BOOKING_ID, gold_obt.HOST_ID, gold_obt.LISTING_ID, gold_obt.TOTAL_BOOKING_AMOUNT, gold_obt.SERVICE_FEE, gold_obt.CLEANING_FEE, gold_obt.ACCOMMODATES, gold_obt.BATHROOMS, gold_obt.BEDROOMS, gold_obt.PRICE_PER_NIGHT, gold_obt.RESPONSE_RATE
FROM
    
    
        AIRBNB.GOLD.obt AS gold_obt
    
    
    
        LEFT JOIN AIRBNB.GOLD.DIM_LISTINGS AS dim_listings
        ON gold_obt.listing_id = dim_listings.listing_id
    
    
    
        LEFT JOIN AIRBNB.GOLD.DIM_HOSTS AS dim_hosts
        ON gold_obt.host_id = dim_hosts.host_id
    
    