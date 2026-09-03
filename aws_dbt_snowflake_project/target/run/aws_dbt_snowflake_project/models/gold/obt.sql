
  
    

create or replace transient table AIRBNB.gold.obt
    
    
    
    
    

    as (

SELECT 
    
        silver_bookings.*,
    
        silver_listings.HOST_ID, silver_listings.PROPERTY_TYPE, silver_listings.ROOM_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES,silver_listings.BATHROOMS, silver_listings.BEDROOMS, silver_listings.PRICE_PER_NIGHT,silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT AS LISTING_CREATED_AT,
    
        silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE, silver_hosts.RESPONSE_RATE_QUALITY, silver_hosts.CREATED_AT AS HOST_CREATED_AT
    
FROM
    
    
        AIRBNB.silver.silver_bookings AS silver_bookings
    
    
    
        LEFT JOIN AIRBNB.silver.silver_listings AS silver_listings
        ON silver_bookings.listing_id = silver_listings.listing_id
    
    
    
        LEFT JOIN AIRBNB.silver.silver_hosts AS silver_hosts
        ON silver_listings.host_id = silver_hosts.host_id
    
    
    )
;


  