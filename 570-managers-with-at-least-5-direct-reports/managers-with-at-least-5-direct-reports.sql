# Write your MySQL query statement below
select name
from (
    select name, count(*) as manname
    from (
        select a1.name as empname, a1.managerID as managerid, b2.name as name
        from employee a1 
        inner join employee b2 on a1.managerid = b2.id
    ) t 
    
    group by managerID, name
) s
where manname >= 5;