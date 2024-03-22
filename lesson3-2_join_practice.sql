create table if not exists station(
	stationCode int primary key,
	stationName varchar,
	stationEName varchar,
	name varchar,
	Ename varchar,
	stationAddTw varchar,
	stationAddEn varchar,
	stationTel varchar,
	gps varchar,
	bike bool
);

create table if not exists stationNum(
	id serial primary key,
	trnDate date,
	stationCode int,
	gateInComing int default 0,
	gateOutGoing int default 0,
	foreign key (stationCode) references station(stationCode)
	on delete set null
	on update cascade
);

DROP table stationNum;

select * from station;
select * from stationNum;

select count(*) from stationNum;

/*連結兩張表*/
select * from stationNum
left join station on stationNum.stationCode = station.stationCode;

/*欄位篩選:日期'進站'出站人數'名稱'地名'地址'bike*/
select trnDate, gateInComing, gateOutGoing, stationName, stationAddTw, bike from stationNum
left join station on stationNum.stationCode = station.stationCode;

/*欄位篩選:屏東的站點有哪些?*/
select distinct(stationName) from stationNum
left join station on stationNum.stationCode = station.stationCode
where stationAddTw like ('屏東%');

/*欄位篩選:基隆火車站2022/3/1的資料*/
select trnDate, gateInComing, gateOutGoing, stationName, stationAddTw, bike from stationNum
left join station on stationNum.stationCode = station.stationCode
where stationName = ('基隆')
and trnDate = '2022-03-01';

/*取出基隆火車站2022年3月份資料,時間由小到大排序*/
select trnDate, gateInComing, gateOutGoing, stationName, stationAddTw, bike from stationNum
left join station on stationNum.stationCode = station.stationCode
where stationName = ('基隆')
and trnDate between '2022-03-01' and '2022-03-31'
order by trnDate asc;

/*取出基隆火車站和臺北火車站2022年3月份資料,時間由小到大排序*/
select trnDate, gateInComing, gateOutGoing, stationName, stationAddTw, bike from stationNum
left join station on stationNum.stationCode = station.stationCode
where stationName in ('基隆', '臺北')
and trnDate between '2022-03-01' and '2022-03-31'
order by trnDate asc;

/*取出資料進站人數最多的前10筆資料*/
select trnDate, gateInComing, gateOutGoing, stationName, stationAddTw, bike from stationNum
left join station on stationNum.stationCode = station.stationCode
order by gateInComing desc
limit 10;

/*取出臺北火車站2022年1月份進口總人數--group by*/
select sum(gateInComing) from stationNum
left join station on stationNum.stationCode = station.stationCode
where stationName = '臺北'
and trnDate between '2022-01-01' and '2022-01-31'
group by stationName