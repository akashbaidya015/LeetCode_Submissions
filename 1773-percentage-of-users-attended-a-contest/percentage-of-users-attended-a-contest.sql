with total_users as (

Select count(*) as count from Users

)
select contest_id, round((count(*)/(select count from total_users) * 100),2) as percentage  from Register  group by contest_id order by percentage desc, contest_id