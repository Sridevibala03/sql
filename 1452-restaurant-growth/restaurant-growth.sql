# Write your MySQL query statement below
SELECT 
    visited_on,
    amount,
    ROUND(
        (amount)/ 7, 2
    ) AS average_amount
FROM (
    SELECT 
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount
    FROM (
        SELECT 
            visited_on,
            SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) AS daily_totals
) AS running
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL 6 DAY FROM Customer
)
group by visited_on
ORDER BY visited_on;

