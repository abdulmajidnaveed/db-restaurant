-- Customer user prompted to enter a food safety complaint 
-- for a restaurant

-- User chooses a restaurant_id : user_selected_rest_rid.
-- User enters:
--  -- customer_dateOfMeal, customer_firstName,
--  -- customer_lastName, customer_phoneNumber, customer_complaint

insert into customer ( phone, firstname, lastname )
 values ( customer_phoneNumber, customer_firstName, customer_lastName );

insert into complaint ( rid, phone, cdate, description )
 values ( user_selected_rest_rid, customer_phoneNumber, customer_dateOfMeal, customer_complaint );

