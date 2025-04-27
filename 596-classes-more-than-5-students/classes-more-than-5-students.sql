with this as 
(
select case when count(*) >= 5 then class else null end as class from Courses group by class
)

select * from this where class is not null