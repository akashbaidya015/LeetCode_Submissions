select Date_format(trans_date,'%Y-%m') as month , country,  count(*) as trans_count ,sum(amount) as trans_total_amount  , count(Case when state='approved' then 1 else null end) as approved_count , sum(case when state = 'approved' then amount else 0 end) as approved_total_amount  
from Transactions group by Date_format(trans_date,'%Y-%m'), country
