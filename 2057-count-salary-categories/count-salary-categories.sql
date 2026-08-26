# Write your MySQL query statement below
SELECT 
    c.category,
    COALESCE(t.accounts_count, 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) AS c
LEFT JOIN (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income >= 50000 THEN 'High Salary'
        END AS category,
        COUNT(account_id) AS accounts_count
    FROM accounts
    GROUP BY category
) AS t 
ON c.category = t.category
ORDER BY 
    CASE c.category
        WHEN 'Low Salary' THEN 1
        WHEN 'Average Salary' THEN 2
        WHEN 'High Salary' THEN 3
    END;
