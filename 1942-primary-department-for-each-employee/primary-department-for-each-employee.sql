# Write your MySQL query statement below
WITH second AS (
    SELECT employee_id, department_id
    FROM employee
    WHERE primary_flag = 'Y'
),
first AS (
    SELECT employee_id, department_id
    FROM employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
)
SELECT * FROM second
UNION
SELECT * FROM first;
