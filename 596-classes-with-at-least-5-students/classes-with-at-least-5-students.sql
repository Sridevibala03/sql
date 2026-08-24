# Write your MySQL query statement below
select class from (select class, count(student) as student_count from courses group by class) meow where student_count >= 5