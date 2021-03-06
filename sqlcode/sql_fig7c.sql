
-- Inspector user: to view summary report of type 3. Fig 7c.
-- Top Health Inspection Ranked Restaurants

-- From GUI, user entered values :
--  user_county, user_year


-- First retrieve maximum inspection scores for each cuisine
create view 7c_temp1 as 
select  cuisine,  max(insp.totalscore ) as max_score 
from inspection as insp , restaurant as R
where  R.rid=insp.rid and county = user_county and date_format(insp.idate, '%Y')=user_year
 group by cuisine
 
-- then find matching restaurant with that score for each cuisine
select  R.cuisine as CUIsine, R.name as RName, 
 concat(R.street, ', ', R.city, ', ' , R.state, ', ',R.zipcode) as ADDRESS, 
 totalscore as Insp_Score
from inspection as insp, restaurant as R, 7c_temp1
where county=user_county and R.rid=insp.rid and date_format(insp.idate, '%Y')=user_year
and 7c_temp1.cuisine=R.cuisine 
and totalscore = 7c_temp1.max_score 

