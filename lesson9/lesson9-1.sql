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

drop table 站點資訊;
drop table youbike;

insert into 站點資訊
values ('500101001','YouBike2.0_捷運科技大樓站','大安區','復興南路二段235號前',25.02605,121.5436)
/*當值重複或衝突時*/
on conflict do nothing;