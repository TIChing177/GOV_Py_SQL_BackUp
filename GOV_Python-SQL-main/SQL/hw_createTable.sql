CREATE TABLE IF NOT EXISTS invoices(
	InvoiceId int,
	CustomerId INT,
	InvoiceDate TIMESTAMP,
	BillingAddress VARCHAR,
	BillingCity VARCHAR,
	BillingState VARCHAR,
	BillingCountry VARCHAR,
	BillingPostalCode VARCHAR,
	Total FLOAT8
);

SELECT * FROM invoices;

drop table invoices;