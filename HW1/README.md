# HW1

## Environment

Docker
```
docker run --name db-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7
docker start db-mysql
docker run -it --link db-mysql:mysql -v `pwd`:/data --rm mysql:5.7 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```
get into terminal
```
docker exec -it db-mysql bash
mysql -u root -p
```

## Create Table
```
create database dbhw1
use dbhw1
CREATE TABLE `match` (matchId varchar(20), matchDuration int, matchType varchar(20), maxPlace int, numGroups int);
LOAD DATA LOCAL INFILE '/data/match.csv' INTO TABLE `match` FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES;
CREATE TABLE player_statistic (Id varchar(20), groupId varchar(20), matchId varchar(20), damageDealt double, DBNOs int, kills int, rideDistance double, walkDistance double, swimDistance double, winPlacePerc double, heals int, roadKills int);

```

### Used Column in player_statistic

- Id
- groupId
- matchId
- DBNOs
- damageDealt
- kills
- walkDistance
- swimDistance
- rideDistance
- winPlacePerc
- heals
- roadKills

## Reference

- [create table](http://tw.gitbook.net/mysql/mysql_create_tables.html)
- [load data](https://dev.mysql.com/doc/refman/8.0/en/load-data.html)
