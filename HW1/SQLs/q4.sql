SELECT P.Id, AVG(P.kills) AS avgKills
FROM player_statistic P
WHERE P.Id IN (SELECT P1.Id
                FROM `match` M, player_statistic P1
                WHERE M.matchId = P1.matchId
                    AND M.numGroups <= 10)
GROUP BY P.Id        
ORDER BY avgKills DESC
LIMIT 20;
