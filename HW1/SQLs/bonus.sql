SELECT MAX(G.groupLongestKills)
FROM (SELECT P.groupId, SUM(P.longestKill) AS groupLongestKills
      FROM player_statistic P
      GROUP BY P.groupId) G
WHERE 


GROUP BY M.matchId
