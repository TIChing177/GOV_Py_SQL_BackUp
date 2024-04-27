create table if not exists 站點資訊(
	站點編號 varchar(10) primary key,
	站點名稱 varchar(30) not null,
	行政區 varchar(10) not null,
	站點地址 varchar(50),
	lat numeric(15,11),
	lng numeric(15,11)
);

select * from 站點資訊;