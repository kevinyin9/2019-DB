SELECT P.Id, AVG(P.kills) AS avgKills
FROM `match` M, player_statistic P
WHERE M.matchId = P.matchId
    AND M.numGroups <= 10
GROUP BY P.Id
ORDER BY avgKills DESC
LIMIT 20;
