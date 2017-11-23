
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- Table `customer`

CREATE TABLE IF NOT EXISTS `customer` (
  `phone` char(10) NOT NULL DEFAULT '',
  `firstname` varchar(15) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `registereduser`

CREATE TABLE IF NOT EXISTS `registereduser` (
  `username` char(10) NOT NULL DEFAULT '',
  `password` char(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `inspector`

CREATE TABLE IF NOT EXISTS `inspector` (
  `iid` int(9) NOT NULL DEFAULT '0',
  `phone` char(10) DEFAULT NULL,
  `username` char(10) DEFAULT NULL,
  `firstname` varchar(15) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `operatorowner`

CREATE TABLE IF NOT EXISTS `operatorowner` (
  `email` varchar(20) NOT NULL DEFAULT '',
  `phone` char(10) DEFAULT NULL,
  `username` char(10) DEFAULT NULL,
  `firstname` varchar(15) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `cuisines`

CREATE TABLE IF NOT EXISTS `cuisines` (
  `cuisine` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`cuisine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `restaurant`

CREATE TABLE IF NOT EXISTS `restaurant` (
  `rid` int(9) NOT NULL DEFAULT '0',
  `phone` char(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` int(5) DEFAULT NULL,
  `cuisine` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `street` (`street`,`city`,`state`,`zipcode`),
  KEY `cuisine` (`cuisine`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `healthpermit`

CREATE TABLE IF NOT EXISTS `healthpermit` (
  `hpid` int(9) NOT NULL DEFAULT '0',
  `expirationdate` date NOT NULL,
  `rid` int(9) NOT NULL,
  PRIMARY KEY (`hpid`),
  UNIQUE KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `item`

-- this is a static table, does not change with use
CREATE TABLE IF NOT EXISTS `item` (
  `itemnum` int(2) NOT NULL DEFAULT '0',
  `perfectscore` int(1) NOT NULL,
  `description` varchar(150) NOT NULL,
  `critical` char(1) NOT NULL,
  PRIMARY KEY (`itemnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `inspection`

CREATE TABLE IF NOT EXISTS `inspection` (
  `rid` int(9) NOT NULL DEFAULT '0',
  `iid` int(9) DEFAULT NULL,
  `idate` date NOT NULL DEFAULT '0000-00-00',
  `totalscore` int(3) DEFAULT NULL,
  `passfail` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`rid`,`idate`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `complaint`

CREATE TABLE IF NOT EXISTS `complaint` (
  `rid` int(9) NOT NULL DEFAULT '0',
  `phone` char(10) NOT NULL DEFAULT '',
  `cdate` date NOT NULL DEFAULT '0000-00-00',
  `description` varchar(80) NOT NULL,
  PRIMARY KEY (`rid`,`phone`,`cdate`),
  KEY `phone` (`phone`)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `contains`
-- this table contains the inspection scores for each item

CREATE TABLE IF NOT EXISTS `contains` (
  `itemnum` int(2) NOT NULL DEFAULT '0',
  `rid` int(9) NOT NULL DEFAULT '0',
  `idate` date NOT NULL DEFAULT '0000-00-00',
  `score` int(2) NOT NULL,
  PRIMARY KEY (`itemnum`,`rid`,`idate`),
  KEY `rid` (`rid`,`idate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- Table `includes`
-- this table gets the inspection comments for an item

CREATE TABLE IF NOT EXISTS `includes` (
  `itemnum` int(2) NOT NULL DEFAULT '0',
  `rid` int(9) NOT NULL DEFAULT '0',
  `idate` date NOT NULL DEFAULT '0000-00-00',
  `comment` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`itemnum`,`rid`,`idate`),
  KEY `rid` (`rid`,`idate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



