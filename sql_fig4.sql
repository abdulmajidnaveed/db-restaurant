-- Restaurant operator user prompted to enter information about their restaurant

-- User enters:
--   user_healthPermitId, user_healthPermitExpirationDate,
--   restaurant_cuisine,
--   restaurant_name,
--   restaurant_street, restaurant_city, restaurant_state, restaurant_zipcode,
--   restaurant_county, restaurant_phone

insert into restaurant 
  ( phone, name, street, city, state, zipcode, county, cuisine, email )
 values ( restaurant_phone, restaurant_name, restaurant_street, restaurant_city,
   restaurant_state, restaurant_zipcode, restaurant_county, restaurant_cuisine,
   restaurantOperator_email
   );
-- This inserts a record into restaurant table, with id restaurant_id
-- restaurant_id is the id of the record inserted into restaurant table

insert into healthpermit 
  ( hpid, expirationdate, rid )
 values ( user_healthPermitId, user_healthPermitExpirationDate, restaurant_id );
