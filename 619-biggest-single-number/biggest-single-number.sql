with table1 as (

    Select num , count(*) as count from MyNumbers group by num
)
select max(num) as num from table1 where count = 1 