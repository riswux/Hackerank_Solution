-- hackers = {
--     hacker_id: int,
--     name: string
-- }

-- challenges = {
--     challenge_id: int,
--     hacker_id: int,
-- }

-- 1. print hacker_id, name, and total_number of challenges
-- 2. Order by descending order of total_number of challenges
-- 3. if total_number of challenges are same, 
--     3.1 then order by order of hacker_id
-- 4. If more than one student created the same number of challenges 
--     and the count is less than the maximum number of challenges created, 
--     then exclude those students from the result.

SELECT H.HACKER_ID, 
       H.NAME, 
       COUNT(C.CHALLENGE_ID) AS C_COUNT
FROM HACKERS H
JOIN CHALLENGES C ON C.HACKER_ID = H.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME
HAVING C_COUNT = 
    (SELECT COUNT(C2.CHALLENGE_ID) AS C_MAX
     FROM CHALLENGES AS C2
     GROUP BY C2.HACKER_ID 
     ORDER BY C_MAX DESC LIMIT 1)
OR C_COUNT IN 
    (SELECT DISTINCT C_COMPARE AS C_UNIQUE
     FROM (SELECT H2.HACKER_ID, 
                  H2.NAME, 
                  COUNT(CHALLENGE_ID) AS C_COMPARE
           FROM HACKERS H2
           JOIN CHALLENGES C ON C.HACKER_ID = H2.HACKER_ID
           GROUP BY H2.HACKER_ID, H2.NAME) COUNTS
     GROUP BY C_COMPARE
     HAVING COUNT(C_COMPARE) = 1)
ORDER BY C_COUNT DESC, H.HACKER_ID;