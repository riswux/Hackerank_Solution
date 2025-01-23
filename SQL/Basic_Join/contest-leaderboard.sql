SELECT
    S.hacker_id, H.name, SUM(score) AS total_score
FROM
    (
        SELECT
            hacker_id, challenge_id, MAX(score) AS score
        FROM
            Submissions
        GROUP BY hacker_id, challenge_id
    ) AS S
JOIN Hackers AS 
ON S.hacker_id = H.hacker_id
GROUP BY S.hacker_id, H.name
HAVING total_score > 0
ORDER BY total_score DESC, S.hacker_id;