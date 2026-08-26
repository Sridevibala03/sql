# Write your MySQL query statement below
with base as(select id, student,  case when (id % 2) = 1 then id + 1 when (id % 2) = 0 then id - 1 end as idd from seat),
cnt AS (
  SELECT COUNT(id) AS total_count FROM seat
)
SELECT 
  CASE 
    -- if last id is odd and this is the last seat, keep it as is
    WHEN id = total_count AND total_count % 2 = 1 THEN id
    ELSE idd
  END AS id,
  student
FROM base
CROSS JOIN cnt
ORDER BY id;