SELECT 
    w.id, wp.age, w.coins_needed, w.power
FROM Wands AS w
JOIN Wands_Property AS wp
ON w.code = wp.code
WHERE wp.is_evil = 0 AND w.coins_needed = (
    SELECT MIN(coins_needed)
    FROM Wands w2
    JOIN Wands_Property wp2
    ON w2.code = wp2.code
    WHERE wp2.age = wp.age
    AND w2.power = w.power
)
ORDER BY 
    w.power DESC, wp.age DESC