create table if not exists 站點資訊(
	站點編號 varchar(10) primary key,
	站點名稱 varchar(30) not null,
	行政區 varchar(10) not null,
	站點地址 varchar(50),
	lat numeric(15,11),
	lng numeric(15,11)
);

select * from 站點資訊;

create table if not exists youbike(
	日期 timestamp,
	編號 varchar(15),
	總車輛 integer,
	可借 integer,
	可還 integer,
	活動 boolean,
	primary key(日期,編號),
	foreign key(編號) references 站點資訊(站點編號)
	on delete cascade
	on update cascade
);

drop table youbike;
drop table 站點資訊;

insert into 站點資訊
values ('500101001','YouBike2.0_捷運科技大樓站','大安區','復興南路二段235號前',25.02605,121.5436)
/*當值重複或衝突時*/
on conflict do nothing;

insert into youbike
values ('2024-04-27 09:39:21','500101001',28,1,27,true)
on conflict do nothing;


select count(*) from youbike;

/*取出最新時間youbike資料*/
SELECT 日期,站點資訊.站點名稱,行政區,站點地址,lat,lng,總車輛,可借,可還,可借,活動
FROM youbike
JOIN 站點資訊 ON youbike.編號 = 站點資訊.站點編號
WHERE (日期,編號) IN (
	SELECT MAX(日期),編號
	FROM youbike
	GROUP BY 編號
	);

/*依據行政區，取出最新時間youbike資料*/
select 日期, 站點資訊.站點編號, 站點名稱, 行政區, 站點地址, lat, lng, 總車輛, 可借,可還, 活動
from youbike left join 站點資訊 on youbike.編號 = 站點資訊.站點編號
where (日期,編號) in (
	select max(日期),編號
	from youbike
	group by 編號
	) and 行政區 = '大安區';