SELECT * FROM public.payment
ORDER BY payment_id ASC LIMIT 100

select first_name || ' ' || last_name as fullName, sum(amount) as total from payment
left join customer using (customer_id)
group by fullName
having sum(amount) >= 200
order by total desc;