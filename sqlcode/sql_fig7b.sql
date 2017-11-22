
-- Inspector user: to view summary report of type 2. Fig 7b.
-- Yearly County Report
-- summary report about restaurant inspections for specified county and year.

-- From GUI, user entered values :
--   user_year, user_county

create view 7bV1 as
select  date_format(idate, '%M') as Month, count(*) as num_restaurants_inspected
from inspection as insp, restaurant as R
where R.rid=insp.rid and county = user_county and date_format(insp.idate, '%Y')=user_year
group by date_format(insp.idate, '%M')
-- gets the table of month and restaurants inspected that month

create view 7bV2 as
select count(*)
from inspection as insp, restaurant as R
where R.rid=insp.rid and county = user_county and date_format(insp.idate, '%Y')=user_year
-- gets the grand total at the bottom of the column

drop view 7bV1
drop view 7bV2
