with tab1 as (
select case when income < 20000 then 'Low Salary' 
 when income between 20000 and 50000 then 'Average Salary' 
 when income > '50000' then 'High Salary' end as category from Accounts
),
tab2 as (
    Select 'Low Salary' as category
    union all
    select 'Average Salary' 
    union all
    select 'High Salary' 

)
select t2.category, count(t1.category) as accounts_count from tab2 t2 left join tab1 t1 on t1.category = t2.category group by t2.category




