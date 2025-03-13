with table1  as (select E.name , B.bonus from Employee E left join Bonus B on E.empID = B.empID )

select * from table1 where bonus < 1000 or bonus is null