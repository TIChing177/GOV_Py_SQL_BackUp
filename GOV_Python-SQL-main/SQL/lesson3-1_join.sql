CREATE TABLE basket_a(
	a INT PRIMARY KEY,
	fruit_a VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b(
	b INT PRIMARY KEY,
	fruit_b VARCHAR(100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

SELECT * FROM basket_a;
SELECT * FROM basket_b;

/*inner join*/
select a,fruit_a,fruit_b from basket_a
inner join basket_b on fruit_a=fruit_b;

/*left join*/
select a,fruit_a,fruit_b from basket_a
left join basket_b on fruit_a=fruit_b
where b is null;

/*right join*/
select a,fruit_a,fruit_b from basket_a
right join basket_b on fruit_a=fruit_b

/*full outer join*/
select a,fruit_a,fruit_b from basket_a
full outer join basket_b on fruit_a=fruit_b

/*full outer join with where*/
select fruit_a,fruit_b from basket_a
full outer join basket_b on fruit_a=fruit_b
where fruit_a is null or fruit_b is null;
