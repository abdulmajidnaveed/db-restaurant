
-- Inspector user: to view summary report of type 1. Fig 7a.
-- Monthly Report
-- summary report about restaurant inspections for specified month and year.

-- From GUI, user entered values :
--   user_month, user_year

-- get restaurants that have inspections for specified month and year
create view V1 as 
select R.county as county, R.cuisine as cuisine, insp.passfail as passfail 
from inspection as insp, restaurant as R
where R.rid=insp.rid 
  and date_format(insp.idate, '%Y') = user_year
  and date_format(insp.idate, '%m') = user_month

-- gets breakdown of county inspections (subtotal for # restaurants inspected)
select V1.county, count(*) from V1 
group by V1.county

-- get breakdown of county inspections failed (subtotal for # restaurants failed)
select V1.county, count(*) from V1 
where V1.passfail = 'no'
group by V1.county

-- get # of restaurants inspected for each cuisine (column # 3)
select V1.county, V1.cuisine, count(*) as num_rest_inspected 
from V1
group by V1.county, V1.cuisine

-- get # of restaurants that failed inspections for each cuisine (column # 4)
select V1.county, V1.cuisine, count(*) as num_rest_failed 
from V1
where V1.passfail = 'no'
group by V1.county, V1.cuisine

-- retrieve grand total # restaurants inspected (bottom row, column # 3)
select count(*) from V1

-- retrieve grand total # restaurants failed (bottom row, column # 4)
select count(*) from V1
where V1.passfail = 'no'

drop view V1
