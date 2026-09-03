
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

SELECT 1
FROM AIRBNB.staging.bookings
WHERE booking_amount < 200
  
  
      
    ) dbt_internal_test