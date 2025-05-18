with tab1 as (Select *, sum(weight) over (order by turn ) as wt from Queue),

tab2 as (

select * from tab1 where wt <= 1000
)
select person_name from tab2 where wt in (select max(wt) from tab2)
