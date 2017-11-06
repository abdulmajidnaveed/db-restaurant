
-- Guest user: to search for restaurants. Fig 2b.


-- From GUI, user entered values : 
--   user_inspectionScore, user_zipcode, user_restaurantName, user_cuisine
--   user_selectedScoreComparisonOperation (">" or "<")

-- This gets the date of last inspection for each restaurant
create view fig2b_lastinspec_date as 
select R.rid as rid,  max(insp.idate) as lastinspecdate 
from restaurant as R, inspection as insp
where R.rid = insp.rid
group by rid


select R.name, R.rid,
concat(R.street, ', ', R.city, ', ' , R.state, ', ',R.zipcode) as R_address,
R.cuisine as cuisine, insp.totalscore , insp.idate
from restaurant as R, inspection as insp, fig2b_lastinspec_date

where R.rid = insp.rid and fig2b_lastinspec_date.lastinspecdate = insp.idate
  and 
  CASE WHEN (user_zipcode IS NOT NULL)
    THEN (R.zipcode like concat(user_zipcode, '%'))
    ELSE true END
  and 
  CASE WHEN (user_cuisine IS NOT NULL)
    THEN (R.cuisine like concat( '%', user_cuisine ,'%'))
    ELSE true END
  and
  CASE WHEN (user_restaurantName IS NOT NULL)
    THEN (R.name like ('%', user_restaurantName, '%'))
    ELSE true END
  and
  CASE WHEN (user_selectedScoreComparisonOperation = ">")
    THEN (insp.totalscore > user_inspectionScore )
    ELSE (insp.totalscore < user_inspectionScore) END
order by totalscore desc


