/*進站人數最多的一筆*/
select stationName, max(gateInComing) from stationNum left join station using(stationcode)
group by stationName
order by max(gateInComing) desc
limit 1
	
select * from stationNum left join station using(stationcode)
where gateInComing = (select max(gateInComing) from stationNum) /*subQuery*/
	
/*各站點進站人數最多的一筆*/
select stationName, max(gateInComing) from stationNum left join station using(stationcode)
group by stationName
order by max(gateInComing) desc

select * from stationNum left join station using(stationcode)
where ((stationCode, max(gateInComing)) in (
	select stationCode, max(gateInComing) from stationNum
	group by stationCode))