with managers as (
select managerId ,  count(*) as count from Employee where managerID is not null group by managerId  having count >= 5  


)

select E.name from Employee E inner join managers m on E.id = m.managerId 
