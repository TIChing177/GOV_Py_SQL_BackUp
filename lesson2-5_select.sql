drop table student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20),
	score INT
);

insert into student values (1,'Mr.A','Math','20');
insert into student values (2,'Mr.B','English','90');
insert into student values (3,'Mrs.C','History','60');
insert into student values (4,'Ms.D','Geography','80');
insert into student values (5,'Mrs.E','English','40');

select * from student;

/*select 欄位名,欄位名
from 表格名
where 篩選、比較運算子
order by 排序 asc|desc
limit 限制筆數
*/

select name as 姓名, major as 主修 from student;

select name as 姓名, major as 主修, score as 分數 
from student
/*where score > 60*/
order by score desc
limit 3;

SELECT * FROM student
where major = 'English';

SELECT * FROM student
where major = 'English' and score < 60;

SELECT * FROM student
where major = 'English' or score > 60;

SELECT * FROM student
where major IN ('English','Math','Geography')

SELECT * FROM student
where score >= 50 AND score <= 80;

SELECT * FROM student
where score BETWEEN 40 AND 90;

SELECT * FROM student
where not NAME = 'Mr.A'

SELECT * FROM student
where name like ('Mr%');