# Write your MySQL query statement below
with accept as (select requester_id as id, Count(accepter_id) as num from RequestAccepted group by id),
request as ( select accepter_id as id, count(requester_id) as num from RequestAccepted group by id),
merged as (select id, num from accept union all
select id, num from request)
select id, sum(num) as num from merged group by id order by num desc limit 1