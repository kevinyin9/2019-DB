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
```sql
CREATE DATABASE dbhw1
USE dbhw1
CREATE TABLE `match` (matchId varchar(20), 
    matchDuration int, 
    matchType varchar(20), 
    maxPlace int, 
    numGroups int);
LOAD DATA 
    LOCAL INFILE '/data/match.csv' 
    INTO TABLE `match` 
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    IGNORE 1 LINES;
CREATE TABLE player_statistic (Id varchar(20), 
    groupId varchar(20), 
    matchId varchar(20), 
    assists int,
    boosts int,
    damageDealt double, 
    DBNOs int, 
    headshotKills int,
    heals int,
    killPlace int,
    killPoints int,
    kills int, 
    killStreaks int,
    longestKill double,
    rankPoints int,
    revives int,
    rideDistance double, 
    roadKills int,
    swimDistance double, 
    teamKills int,
    vehicleDestroys int,
    walkDistance double,
    weaponsAcquired int,
    winPoints int, 
    winPlacePerc double);
LOAD DATA 
    LOCAL INFILE '/data/player_statistic.csv' 
    INTO TABLE player_statistic 
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    IGNORE 1 LINES;
```

## Create Index
```
CREATE INDEX mmId ON `match` (matchId);
CREATE INDEX pmId ON player_statistic (matchId);
```

## Notes

### ORDER BY
```
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```

### LIMIT
```
LIMIT begin, end;
```

## Bonus

找出比賽類型為 squad-fpp 的比賽中，每一場以隊伍為單位最高的 longestKill 總和 groupLongestKills，並配上 matchId 取前 10 長輸出。

## Reference

- [create table](http://tw.gitbook.net/mysql/mysql_create_tables.html)
- [load data](https://dev.mysql.com/doc/refman/8.0/en/load-data.html)
