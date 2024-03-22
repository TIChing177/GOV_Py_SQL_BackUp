CREATE TABLE IF NOT EXISTS cityList(
	id SERIAL,
	name VARCHAR(30),
	population INT,
	PRIMARY KEY(id)
);

SELECT * FROM cityList;