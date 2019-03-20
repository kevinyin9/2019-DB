SELECT T.teamRoadKills AS teamRoadKills, AVG(T.avgWins) AS avgWinPlacePerc
FROM (SELECT SUM(P.roadKills) AS teamRoadKills, AVG(P.winPlacePerc) AS avgWins
      FROM player_statistic P, `match` M
      WHERE P.matchId = M.matchId
      AND (M.matchType = "squad" OR M.matchType = "squad-fpp")
      GROUP BY P.groupId) T
GROUP BY teamRoadKills
ORDER BY teamRoadKills DESC;
