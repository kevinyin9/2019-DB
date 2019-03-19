SELECT P.matchId, MAX(P.DBNOs)
FROM player_statistic P
GROUP BY P.matchId
ORDER BY MAX(P.DBNOs) DESC LIMIT 20;

