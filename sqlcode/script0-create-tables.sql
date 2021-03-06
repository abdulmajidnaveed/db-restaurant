create table customer(
phone char(10),
firstname varchar(15),
lastname varchar(30),
primary key (phone)
) ENGINE = InnoDB;

create table registereduser (
username char(10),
password char(10),
primary key (username)
) ENGINE = InnoDB;

create table inspector(
iid integer(9),
phone char(10),
username char(10),
firstname varchar(15),
lastname varchar(30),
primary key (iid),
unique (phone),
unique (username),
foreign key (username) 
    references registereduser(username)
) ENGINE = InnoDB;

create table cuisines (
cuisine varchar(20),
primary key (cuisine)
) ENGINE = InnoDB;

create table operatorowner(
email varchar(20),
phone char(10),
username char(10),
firstname varchar(15),
lastname varchar(30),
primary key (email),
unique (phone),
unique (username),
foreign key (username) 
    references registereduser(username)
) ENGINE = InnoDB;

create table restaurant (
rid integer(9),
phone char(10),
name varchar(30),
county varchar(20),
street varchar(20),
city varchar(20),
state char(2),
zipcode integer(5),
cuisine varchar(20),
email varchar(20) not null,
primary key (rid),
unique (phone),
unique (street, city, state, zipcode),
foreign key (cuisine) 
    references cuisines(cuisine),
foreign key (email) 
    references operatorowner(email)
) ENGINE = InnoDB;

create table healthpermit (
hpid integer (9),
expirationdate date not null,
rid integer (9) not null,
primary key (hpid),
unique (rid),
foreign key (rid) 
    references restaurant(rid)
) ENGINE = InnoDB;

create table item (
itemnum integer(2),
perfectscore integer(1) not null,
description varchar(80) not null,
critical char(1) not null,
primary key (itemnum),
constraint checkitem check (itemnum > 0 and itemnum < 16)
) ENGINE = InnoDB;

create table inspection (
rid integer (9),
iid integer(9),
idate date,
totalscore integer(3),
passfail varchar(3),
primary key (rid, idate),
foreign key (iid) 
    references inspector(iid),
foreign key (rid) 
    references restaurant(rid),
constraint tots check (totalscore > 0 and totalscore < 101),
constraint pf check (passfail = 'yes' or passfail = 'no')
) ENGINE = InnoDB;

create table complaint (
rid integer (9),
phone char(10),
cdate date,
description varchar (80) not null,
primary key (rid, phone, cdate),
foreign key (phone) references customer (phone),
foreign key (rid) references restaurant(rid)
) ENGINE = InnoDB;

create table contains (
itemnum integer(2),
rid integer (9),
idate date,
score integer (2) not null,
primary key (itemnum, rid, idate),
foreign key (rid, idate) references inspection (rid, idate),
foreign key (itemnum) references item (itemnum)
) ENGINE = InnoDB;

create table includes (
itemnum integer(2),
rid integer (9),
idate date,
comment varchar(80),
primary key (itemnum, rid, idate),
foreign key (rid, idate) references inspection (rid, idate),
foreign key (itemnum) references item (itemnum)
) ENGINE = InnoDB;

