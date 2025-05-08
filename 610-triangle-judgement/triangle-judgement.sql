with table1 as (
    Select * , case when ( x + y > z) then 1 else 0 end as a,
case when (y + z > x) then 1 else 0 end as b,
case when (z + x > y) then 1 else 0 end as c from Triangle
)

select x,y,z , case when a + b + c = 3 then 'Yes' else 'No' end as triangle from table1



