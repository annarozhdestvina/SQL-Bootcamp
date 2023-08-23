
with cte_last_rate_to_usd as (
	with last_updated as (
		select 
		currency.name, 
		max(currency.updated) as max_updated
		from currency
		group by currency.name)

	select 
	
	currency.id as currency_id,
	last_updated.name as currency_name, 
	last_updated.max_updated as last_updated,
	currency.rate_to_usd
	
	from currency
	join last_updated on currency.updated = last_updated.max_updated and currency.name = last_updated.name
)


select 


	case
	when users.name is null then 'not defined'
	else users.name
	end 
	as name,
	
	
	case 
	when users.lastname is null then 'not defined'
	else users.lastname
	end
	as lastname,
	
	
	balance.type as type,
	
	
	sum(balance.money) as volume, 
	
	
	case
	when cte_last_rate_to_usd.currency_name is null then 'not defined'
	else cte_last_rate_to_usd.currency_name
	end
	as currency_name,
	
	
	case
	when cte_last_rate_to_usd.rate_to_usd is null then 1
	else cte_last_rate_to_usd.rate_to_usd
	end
	as last_rate_to_usd,
	
	
	sum(balance.money) * 
	case
	when cte_last_rate_to_usd.rate_to_usd is null then 1
	else cte_last_rate_to_usd.rate_to_usd
	end
	as total_volume_in_usd
	
	
from users
left join balance on balance.user_id = users.id
left join cte_last_rate_to_usd on balance.currency_id = cte_last_rate_to_usd.currency_id
group by users.name, users.lastname, balance.type, cte_last_rate_to_usd.currency_name, cte_last_rate_to_usd.rate_to_usd
order by name desc, lastname asc, type asc; 
