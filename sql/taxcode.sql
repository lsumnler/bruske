CREATE TABLE `taxcode` (
  `taxno` int(11) PRIMARY KEY,
  `cityname` varchar(60) NOT NULL,
  `cityno` int(7) default NULL,
  `citytax` float default NULL,
  `countyname` varchar(60) default NULL,
  `countyno` int(7) default NULL,
  `countytax` float default NULL,
  `spdname` varchar(60) default NULL,
  `spdno` int(7) default NULL,
  `spdtax` float default NULL,
  `transitname` varchar(60) default NULL,
  `transitno` int(7) default NULL,
  `transittax` float default NULL,
  `totaltax` float default NULL,
  `spd2name` varchar(60) default NULL,
  `spd2no` int(7) default NULL,
  `spd2tax` float default NULL,
  `transit2name` varchar(60) default NULL,
  `transit2no` int(7) default NULL,
  `transit2tax` float default NULL
);

create index city on taxcode (cityname);

create index county on taxcode (countyname);

create index citycounty on taxcode (cityname, countyname);
