-- Inspector user prompted to enter a restaurant inspection report
-- retrieve static information about
select itemnum, description, critical
 from item;





-------------------------------
-- to run once at start of table setup:

--1:
insert into item ( description, perfectscore, critical )
 values ( 'The food is in good condition and safe for human consumption', 9, 'Y');
--2:
insert into item ( description, perfectscore, critical )
 values (
   'Potentially hazardous food is stored, prepared, displayed according to specified time and temperature requirements', 9, 'Y');
--3:
insert into item ( description, perfectscore, critical )
 values (
   'Cross-contamination is prevented', 9, 'Y');
--4:
insert into item ( description, perfectscore, critical )
 values (
   'Personnel with infections or communicable diseases are restricted from handling food', 9, 'Y');
--5:
insert into item ( description, perfectscore, critical )
 values (
   'Personnel wash hands and use good hygienic practices', 9, 'Y');
--6:
insert into item ( description, perfectscore, critical )
 values (
   'Food equipment and utensils are properly sanitized', 9, 'Y');
--7:
insert into item ( description, perfectscore, critical )
 values (
   'Hot and cold water is from a safe and approved source', 9, 'Y');
--8:
insert into item ( description, perfectscore, critical )
 values (
   'Insects, rodents and other animals are kept out of the restaurant', 9, 'Y');

--9:
insert into item ( description, perfectscore, critical )
 values (
   'Proper equipment is used to maintain product temperature', 4, 'N');
--10:
insert into item ( description, perfectscore, critical )
 values (
   'Gloves or utensils are used to minimize handling of food and ice', 4, 'N');
--11:
insert into item ( description, perfectscore, critical )
 values (
   'Dishwashing facilities are properly constructed and maintained', 4, 'N');
--12:
insert into item ( description, perfectscore, critical )
 values (
   'Restrooms are clean and properly maintained', 4, 'N');
--13:
insert into item ( description, perfectscore, critical )
 values (
   'Rubbish containers are covered and properly located', 4, 'N');
--14:
insert into item ( description, perfectscore, critical )
 values (
   'Outside garbage disposal areas are enclosed and clean', 4, 'N');
--15:
insert into item ( description, perfectscore, critical )
 values (
   'Non-food contact surfaces of equipment and utensils are clean and free of contaminants', 4, 'N');
