CREATE TABLE IF NOT EXISTS studentList(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20)
);

DROP TABLE studentList;

CREATE TABLE IF NOT EXISTS artistList(
	id SERIAL,
	name VARCHAR
);

SELECT * FROM artistList;