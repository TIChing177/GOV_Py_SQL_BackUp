/* field constraints*/
/* primary key, 
	not null, 
	unique(不可重覆), 
	default(新增值時可以不設)*/
	
create table student(
	student_id serial primary key,
	name varchar(20) not null unique,
	major varchar(20) unique
);

select * from student;

insert into student values(2,'Ms.B','Math') 
returning *;

/*指定欄位都要有*/
insert into student(name, major) values ('Ms.D','Geography')
returning *;

drop table student;

/*新增多筆*/
insert into student(name, major) values ('Mr.A','Math'),('Mr.B','English'),('Mrs.C','History')
returning *;