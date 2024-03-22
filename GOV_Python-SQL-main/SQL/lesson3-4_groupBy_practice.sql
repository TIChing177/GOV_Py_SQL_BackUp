/*全省各站點2022年進站總人數*/
select stationName ,sum(gateInComing) as totalNum from stationNum
left join station using (stationCode)
where trnDate between '2022-01-01' and '2022-12-31'
group by stationName
order by totalNum desc;

/*全省各站點2022年進站總人數大於5佰萬人的站點*/
select stationName, sum(gateInComing) as totalNum from stationNum
left join station using (stationCode)
where trnDate between '2022-01-01' and '2022-12-31'
group by stationName
having sum(gateInComing)> 5000000;

/*基隆火車站2020年,每月份進站人數*/
select extract(month from trnDate) as month, sum(gateInComing) as totalEntranceNum from stationNum
left join station using (stationCode)
where stationName = '基隆'
and trnDate between '2020-01-01' and '2020-12-31'
group by month;

/*基隆火車站2020年,每月份進站人數,由多至少*/
select extract(month from trnDate) as month, sum(gateInComing) as totalEntranceNum from stationNum
left join station using (stationCode)
where stationName = '基隆'
and trnDate between '2020-01-01' and '2020-12-31'
group by month
order by totalEntranceNum desc;

/*基隆火車站2020,2021,2022,每年進站人數*/
select extract(year from trnDate) as year, sum(gateInComing) as totalEntranceNum from stationNum
left join station using (stationCode)
where stationName = '基隆'
and trnDate between '2020-01-01' and '2022-12-31'
group by year;

/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
select extract(year from trnDate) as year, stationName, sum(gateInComing) as totalEntranceNum from stationNum
left join station using (stationCode)
where stationName in ('基隆', '臺北')
and trnDate between '2020-01-01' and '2022-12-31'
group by year, stationName
order by year;
/*total*/
select extract(year from trnDate) as year, sum(gateInComing) as totalEntranceNum from stationNum
left join station using (stationCode)
where stationName in ('基隆', '臺北')
and trnDate between '2020-01-01' and '2022-12-31'
group by year;