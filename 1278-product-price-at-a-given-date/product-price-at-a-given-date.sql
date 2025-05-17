with tab1 as (
select * , max(change_date) over (partition by product_id) as new_date from Products where 
change_date <= '2019-08-16' order by product_id   desc
),
 tab2 as (

    select * from tab1 where change_date = new_date
    )
select product_id , new_price as price from tab2 
union
select product_id , 10 from products where product_id not in (select product_id from tab2)
