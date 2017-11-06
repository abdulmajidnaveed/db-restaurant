
-- Inspector user: to view summary report of type 4. Fig 7d.
-- Restaurants with Complaints (at least 1 non perfect critical item score)

-- summary report listing restaurants and customer complaints for 
-- restaurants with 
-- number of complaints >= a specified number of complaints
-- and an inspection score <= a specified inspection score on their last inspection
--  where a less than perfect score was given on at least one critical item

-- From GUI, user entered values :
--   user_year, user_minComplaints, user_maxScore


-- First step is to get the most recent inspection dates for each restaurant inspection
create view 7dV1 as 
select R.rid as rid, 
  R.name as RName, 
  concat(R.street, ', ', R.city, ', ' , R.state, ', ',R.zipcode) as R_ADDRESS, 
  concat(OpOwn.firstname, ' ', OpOwn.lastname) as Op_Owner, 
  OpOwn.email as Op_email, 
  max(INSP.idate) as max_Idate
from inspection as INSP, restaurant as R, operatorowner as OpOwn
where 
      OpOwn.email = R.email  and 
      R.rid=INSP.rid   
group by rid


-- Use this query to get all restaurants that have some 
-- non-perfect score on a critical item on their most recent inspection, AND
-- inspection score lower than a specified inspection score on their most recent inspection
create view 7dV2 as 
select 7dV1.RName as RName, 7dV1.R_ADDRESS as R_ADDRESS, 
7dV1.Op_Owner as Op_Owner, 7dV1.Op_email as Op_email, 
7dV1.rid as Rid, 7dV1.max_Idate as max_Idate , 
C.itemnum, C.score, I.perfectscore, I.critical, 
INSP.totalscore
from 7dV1, inspection  as INSP, contains as C, item as I
  where
       date_format (7dV1.max_Idate, '%Y') = user_year and
       INSP.totalscore <= user_maxScore and
       7dV1.rid=INSP.rid and 7dV1.max_Idate = INSP.idate and
       7dV1.rid=C.rid and
       C.idate=INSP.idate and I.itemnum=C.itemnum
   and C.score<I.perfectscore and I.critical='Y'
group by rid

-- Next get the # complaints for each restaurant- this has the data to show
-- # of complaints on the screen 
create view numberOfComplaints as
select rid, count(*) as numCompl 
from complaint
group by rid

-- This gets the restaurants with # of complaints > a specified #
-- and also gets the set of all customer complaints for each restaurant
select R.name as RName,
  concat(R.street, ', ', R.city, ', ' , R.state, ', ',R.zipcode) as R_ADDRESS ,
  R.rid as Rid, complaint.cdate,
  complaint.description as complaintDescription,
  numberOfComplaints.numCompl as numComplaints
from restaurant as R, complaint , numberOfComplaints
where 
  complaint.rid=R.rid and 
  numberOfComplaints.rid = R.rid and 
  numberOfComplaints.numCompl >= user_minComplaints

