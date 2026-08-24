# Write your MySQL query statement below
SELECT 
    i.product_id,
    ROUND(COALESCE(SUM(s.units * i.price) / SUM(s.units), 0), 2) AS average_price
FROM UnitsSold AS s
RIGHT JOIN Prices AS i 
    ON s.product_id = i.product_id
   AND s.purchase_date BETWEEN i.start_date AND i.end_date
GROUP BY i.product_id;