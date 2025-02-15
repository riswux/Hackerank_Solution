SELECT
    MAX(SALARY*MONTHS) AS MAXIMUM_EARN,
    COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEE_ID
FROM EMPLOYEE 
WHERE SALARY*MONTHS = (SELECT MAX(SALARY*MONTHS) FROM EMPLOYEE);