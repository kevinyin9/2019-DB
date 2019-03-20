SELECT COUNT(P.Id) AS numberOfPlayers, MAX(P.heals) AS maxHeals
FROM player_statistic P, `match` M
WHERE P.matchId = M.matchId
      AND M.matchDuration > (SELECT AVG(M1.matchDuration)
                             FROM `match` M1)
      AND P.damageDealt = 0
      AND winPlacePerc = 1;

