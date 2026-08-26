# Write your MySQL query statement below
with tabe as (SELECT 
  num,
  LAG(num, 1) OVER (ORDER BY id) AS num1,
  LAG(num, 2) OVER (ORDER BY id) AS num2
FROM logs)

select distinct num as consecutiveNums from tabe where num = num1 and num = num2
