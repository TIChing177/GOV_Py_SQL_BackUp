create table if not exists student_score(
	id serial primary key,
	name varchar(5),
	chinese smallint,
	math smallint,
	english smallint
);