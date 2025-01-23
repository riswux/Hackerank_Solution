-- students = {
--     id: int,
--     name: string,
--     marks: int
-- }

-- grades = {
--     grade, min_marks, max_marks
-- }

-- 1. generate coloumns of Name,Grade, and marks
-- 2. Not consist of grade lower than 8
-- 3. report must order by descending order of grade  
--     3.1 if marks are same (8-10), then order by ascending order of name
--     3,2 assigend them by alphabeticly
-- 4. If grade lower than 8 use NULL
--     4.1 if marks of students (1-7) assigned to them,
--     4.2 order them by ascending order

SELECT
    CASE 
        WHEN g.grade < 8 THEN 'NULL'
        ELSE s.name
    END,
    g.grade,
    s.marks
FROM grades AS g
JOIN students AS s 
    ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC, s.name ASC;