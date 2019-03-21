SELECT G.matchId, MAX(G.groupLongestKills) as maxGroupLongestKills
FROM (SELECT P.groupId, P.matchId, SUM(P.longestKill) AS groupLongestKills
      FROM player_statistic P
      GROUP BY P.groupId, P.matchId) G,
      `match` M
WHERE G.matchId = M.matchId
      AND M.matchType = "squad-fpp"
GROUP BY G.matchId
ORDER BY maxGroupLongestKills DESC
LIMIT 10;
