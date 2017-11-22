
-- Restaurant operator user: display all restaurant information
-- associated with this user


select R.rid, R.name, 
  concat(R.street, ', ', R.city, ', ' , R.state, ', ',R.zipcode) as Address
from restaurant as R, operatorowner as OP
where R.email = OP.email
  and OP.username = restaurantOperator_username 
  -- and OP.email = restaurantOperator_email -- not necessary, but stronger condition

