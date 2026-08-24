# Write your MySQL query statement below
with countuser as (select contest_id, count(user_id) as sum_user from Register group by contest_id), 

Totaluser as ( select count(user_id) as tuser from Users),

percentageper as( select c.contest_id, c.sum_user,t.tuser, round((100 * c.sum_user/ t.tuser),2) as percentage from countuser c cross join Totaluser t )

select contest_id, percentage from percentageper order by percentage desc, contest_id asc