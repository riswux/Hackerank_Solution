SELECT
    CASE
        WHEN A = B = C THEN 'Equilateral'
        WHEN A != B != C THEN 'Scalene'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE
            'Not A Triangle'
    END
FROM TRIANGLES 
