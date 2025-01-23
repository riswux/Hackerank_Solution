hackers = {
    hacker_id: int,
    name: string
}

difficulty = {
    difficulty_level: int,
    score: int
}

challenges = {
    challenge_id: int,
    hacker_id: int,
    difficulty_level: int
}

submissions = {
    submissions_id: int,
    hacker_id: int,
    challenge_id: int,
    score: int
}

1. print hacker_id, name
    1.1 who achieve full score more than one challenge
2. Order by descending order of total number challenges who earned full scored
3. sort by ascending order of hacker_id


SELECT
    h.hacker_id, 
    h.name
FROM hackers AS h
JOIN submissions AS s
    ON h.hacker_id = s.hacker_id
JOIN challenges AS c
    ON s.challenge_id = c.challenge_id
JOIN difficulty AS d
    ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC;




