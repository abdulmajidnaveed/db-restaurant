
-- Restaurant operator user: to display health inspection report results for 
-- the last two inspections. Fig 5b.

-- Restaurant selected - restaurant_id

create view fig5b_thisrest_inspresultsneeded as 
select * from inspection as insp
where insp.rid = restaurant_id

create view fig5b_mostrecentdate as 
(select max(idate) as max from fig5b_thisrest_inspresultsneeded) 

create view fig5b_mostrecent2nddate as
select max(idate) as max2 from fig5b_thisrest_inspresultsneeded 
where idate not in (select max from fig5b_mostrecentdate )

-- create view fig5b_mostrecent2dates as
--   select fig5b_mostrecentdate.max as max, fig5b_mostrecent2nddate.max2 as max2
--   from fig5b_mostrecentdate, fig5b_mostrecent2nddate 

----------------------------------------------
-- step ii: get the data in the form of a custom table containing 
-- information on the two dates: fifteen rows of item data with
-- columns itemnum, description, 2ndmostrecentscore, mostrecentscore

select item.itemnum, item.description,
Cmax2.score as 2ndmostrecentscore,
Cmax.score as mostrecentscore
from
  item as item, `contains` as Cmax2, fig5b_mostrecent2nddate,
  contains as Cmax, fig5b_mostrecentdate
where
  (
    -- join item and contains on itemnum,
    -- match date to fig5b_mostrecent2nddate.max2, and restaurantid
    Cmax2.itemnum = item.itemnum
    and Cmax2.rid = restaurant_id and Cmax2.idate = fig5b_mostrecent2nddate.max2
  ) and (
    -- join item and contains on itemnum,
    -- match date to fig5b_mostrecentdate.max, and restaurantid
    Cmax.itemnum=item.itemnum
    and Cmax.rid = restaurant_id and Cmax.idate = fig5b_mostrecentdate.max
  )
-- This gets a set of rows that have the data in the columns that display the main results

----------------------------------------------
-- step iii: get the totalscore and passfail recent two dates 

select 
  insp_2ndmostrecent.totalscore as 2ndmostrecentscore, 
  insp_mostrecent.totalscore    as mostrecentscore,
  insp_2ndmostrecent.passfail   as 2ndmostrecent_passfail, 
  insp_mostrecent.passfail      as mostrecent_passfail

from inspection as insp_2ndmostrecent, inspection as insp_mostrecent, 
  fig5b_mostrecent2nddate, fig5b_mostrecentdate

where 
  insp_2ndmostrecent.rid = restaurant_id and 
  insp_2ndmostrecent.idate = fig5b_mostrecent2nddate.max2 and 
  insp_mostrecent.rid=restaurant_id and 
  insp_mostrecent.idate = fig5b_mostrecentdate.max

-- This gets the total score and pass/fail result for both of 
-- the most recent 2 inspections


-- delete views...


