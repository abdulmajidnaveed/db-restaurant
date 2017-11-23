
--
-- Constraints for table `inspector`
--
ALTER TABLE `inspector`
  ADD CONSTRAINT `inspector_ibfk_1` FOREIGN KEY (`username`) REFERENCES `registereduser` (`username`);

--
-- Constraints for table `operatorowner`
--
ALTER TABLE `operatorowner`
  ADD CONSTRAINT `operatorowner_ibfk_1` FOREIGN KEY (`username`) REFERENCES `registereduser` (`username`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`cuisine`) REFERENCES `cuisines` (`cuisine`),
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`email`) REFERENCES `operatorowner` (`email`);

--   Constraints for table `item`
--   this is a static table, is populated once, does not change with use
ALTER TABLE `item`
  ADD CONSTRAINT validItemnum CHECK (itemnum > 0 AND itemnum <= 15),
  ADD CONSTRAINT validCritical CHECK (`critical` = 'Y' OR `critical` = 'N');

--
-- Constraints for table `healthpermit`
--
ALTER TABLE `healthpermit`
  ADD CONSTRAINT `healthpermit_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`rid`);

--
-- Constraints for table `inspection`
--
ALTER TABLE `inspection`
  ADD CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `inspector` (`iid`),
  ADD CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`rid`),
  ADD CONSTRAINT validTotalscore CHECK (`totalscore` >= 0 AND `totalscore` <= 100),
  ADD CONSTRAINT validPassfail CHECK (`passfail` = 'PASS' OR `passfail` = 'FAIL');

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`rid`),
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`phone`) REFERENCES `customer` (`phone`);

--
-- Constraints for table `contains`
-- this table gets the scores for each item
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`rid`, `idate`) REFERENCES `inspection` (`rid`, `idate`),
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`itemnum`) REFERENCES `item` (`itemnum`);
-- Todo: add contraint to enforce contains.score < item.perfectscore, 
--   joining on contains.itemnum with item.itemnum

--
-- Constraints for table `includes`
--
ALTER TABLE `includes`
  ADD CONSTRAINT `includes_ibfk_1` FOREIGN KEY (`rid`, `idate`) REFERENCES `inspection` (`rid`, `idate`),
  ADD CONSTRAINT `includes_ibfk_2` FOREIGN KEY (`itemnum`) REFERENCES `item` (`itemnum`);


