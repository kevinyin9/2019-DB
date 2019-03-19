SELECT P.Id, P.matchId, P.damageDealt
FROM player_statistic P
WHERE P.damageDealt <= 2010 AND P.damageDealt >= 2000;
