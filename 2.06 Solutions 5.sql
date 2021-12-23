/* 
 2.06 Activity 1
 Keep working on the bank database and its card table.
 */
# Queries:
# 1) Get different card types. 
SELECT
	DISTINCT TYPE
FROM
	card;

# 2) Get transactions in the first 15 days of 1993.
SELECT
	*
FROM
	trans
WHERE
	date BETWEEN 930101
	AND 930115;

# 3) Get all running loans.
/*
 In the database doc running loans are described as:
 Status 'C': stands for running contract, OK so far.
 */
SELECT
	*
FROM
	loan
WHERE
	STATUS = 'C';

/*
 4) Find the different values from the field A2 that start with the letter 'K'.
 
 Here we can use the REGEXP (regular expressions) to help with the search 
 of data matching complex criteria.
 */
SELECT
	A2
FROM
	district
WHERE
	A2 REGEXP '^K';

/*
 5) Find the different values from the field A2 that end with the letter 'K'.
 */
SELECT
	A2
FROM
	district
WHERE
	A2 REGEXP 'K$';

# 6) Discuss the possible use cases of using regular expressions in your query.
/* 
 MySQL Regular expressions allow us to search data matching even more complex criterion.
 */
/*2.6 Activity 2
 1) Can you use the following query:
 */
SELECT
	*
FROM
	bank.district
WHERE
	a3 LIKE 'north%M%';

# instead of:
SELECT
	*
FROM
	bank.district
WHERE
	a3 LIKE 'north_M%';

/*
 Try both the queries and check the results.
 */
SELECT
	*
FROM
	bank.district
WHERE
	a3 LIKE 'north%M%';

/*This query can be used if you are looking for a value which starts with north and has 
 a capital M anywhere after north. This is the reason why the query brings back 
 Noth Bohamia and North Moravia. The % allows you to match any string of any length
 including cero length.
 */
SELECT
	*
FROM
	bank.district
WHERE
	a3 LIKE 'north_M%';

/*
 This query is more granular asking for a value that
 matches north and only one character or anything of the sort but only one
 then a value that starts with capital M and any character after.
 */
/*
 2) We looked at the following query in class:
 */
SELECT
	*
FROM
	bank.district
WHERE
	a2 REGEXP 'ch[e-r]';

/*
 Can you modify the query to print the rows only for those values in the A2 column that starts with 'CH'?
 */
SELECT
	*
FROM
	bank.district
WHERE
	a2 REGEXP '^ch';

/*
 3) Use the table trans for this query. Use the column type to test: "By default, in an ascending sort, 
 special characters appear first, followed by numbers, and then letters."
 */
SELECT
	*
FROM
	bank.trans
WHERE
	TYPE REGEXP '^ch';

/*
 4) Again use the table trans for this query. Use the column k_symbol to test: 
 "Null values appear first if the order is ascending."
 */
/*
 Pick any table and any column to test: "You can use any column from the table 
 to sort the values even if that column is not used in the select statement." Check 
 the difference by writing the query with and without that column (column used to sort 
 the results) in the select statement.
 */
/*
 2.06 Activity 3
 */
/*
 --1 During the lesson, we mentioned that one of the primary reasons for normalizing 
 tables is to eliminate data redundancy. Otherwise, data redundancy can result in highly 
 inefficient data storages. Which other problems you may think non-normalized structure may have?
 
 
 Answer:
 
 When several instances of the same data are scattered across different tables without proper 
 relationship/link, it can cause strange conditions where some will get updated with new values 
 whereas others won't. This leaves our database in an inconsistent state!
 */
/*
 2.06 Activity 4
 */
/*
 Now use the bank database to make the following changes:
 
 a. Use the insert command to create a new entry in the loan table 
 with the following values (8000,8000000,930705,96396,12,8033.0,'C'). 
 Here each element corresponds to the values in columns in the table 
 (in the order the columns appear in the table). This might raise 
 an error. Why is that?
 */
INSERT INTO
	loan
VALUES
	(8000, 8000000, 930705, 96396, 12, 8033.0, 'C');

/*
 I was able to insert the values. Although if there had been
 a Primary Key for the loan_id and a Foreign Key for the account_id, 
 it would not have been possible to insert the new values.
 */
/*
 b. Use the delete command to delete an entry from the table account where 
 the account_id is 11382. Does this result in an error? If it does, then why?
 */
DELETE FROM
	account
WHERE
	account_id = 11382;

/*
 I was able to delete the record successfully
 */
/*
 4. Design and create a new database structure. Justify your changes.
 */
DROP schema IF EXISTS demobank;

CREATE schema demobank;

USE demobank;

# Table structure for table "bank"
CREATE TABLE bank (
	bank_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	bank_code varchar(2) NOT NULL,
	bank_name varchar(20) NOT NULL
);

# Table structure for table "branch"
CREATE TABLE branch (
	branch_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	branch varchar(20),
	address_id int UNSIGNED,
	district_id int UNSIGNED,
	region_id int UNSIGNED
);

# Table structure for table "phone"
CREATE TABLE phone (
	phone_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	phone_1 varchar(15) NOT NULL,
	phone_2 varchar(15)
);

# Table structure for table "client_"
CREATE TABLE client_ (
	client_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	dob date NOT NULL,
	district_id int UNSIGNED,
	first_name text(20) NOT NULL,
	last_name text(20) NOT NULL,
	address_id int UNSIGNED,
	client_status_id int UNSIGNED,
	phone_id int UNSIGNED,
	gender text(1) NOT NULL
);

# Table structure for table "postcode"
CREATE TABLE postcode (
	postcode_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	postcode varchar(5) NOT NULL
);

# Table structure for table "region"
CREATE TABLE region (
	region_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	region varchar(20) NOT NULL
);

# Table structure for table "district"
CREATE TABLE district (
	district_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	district varchar(20) NOT NULL,
	region_id int UNSIGNED,
	demographics_id int UNSIGNED
);

# Table structure for table "client_status"
CREATE TABLE client_status (
	client_status_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	client_status varchar(15) NOT NULL
);

# Table structure for table "address"
CREATE TABLE address (
	address_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	address varchar(50) NOT NULL,
	district_id int UNSIGNED,
	region_id int UNSIGNED,
	postcode_id int UNSIGNED
);

# Table structure for table "frequency"
CREATE TABLE frequency (
	frequency_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	frequency varchar(10) NOT NULL
);

# Table structure for table "account"
CREATE TABLE account_ (
	account_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	district_id int UNSIGNED,
	frequency_id int UNSIGNED,
	client_id int UNSIGNED,
	branch_id int UNSIGNED,
	opening_date datetime NOT NULL,
	account_balance decimal(15, 2) NOT NULL
);

# Table structure for table "trans_type"
CREATE TABLE trans_type (
	trans_type_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	trans_type char(10) NOT NULL
);

# Table structure for table "operation"
CREATE TABLE operation (
	operation_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	operation varchar(15) NOT NULL
);

# Table structure for table "trans_k"
CREATE TABLE trans_k (
	trans_k_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	trans_k varchar(15) NOT NULL,
	trans_id int UNSIGNED
);

# Table structure for table "transactions"
CREATE TABLE transactions (
	trans_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	account_id int UNSIGNED,
	trans_date datetime NOT NULL,
	trans_type_id int UNSIGNED,
	operation_id int UNSIGNED,
	trans_amount decimal(15, 2) NOT NULL,
	balance decimal(15, 5) NOT NULL,
	trans_k_id int UNSIGNED,
	bank_id int UNSIGNED,
	account_number varchar(50) NOT NULL
);

# Table structure for table "demographics"
CREATE TABLE demographics (
	demographics_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	a4_id int,
	a5_id int,
	a6_id int,
	a7_id int,
	a8_id int,
	a9_id int,
	a10_id float,
	a11_id int,
	a12_id float,
	a13_id float,
	a14_id int,
	a15_id int,
	a16_id int
);

# Table structure for table "card_type"
CREATE TABLE card_type (
	card_type_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	card_type varchar(10) NOT NULL
);

# Table structure for table "card"
CREATE TABLE card (
	card_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	client_status_id int UNSIGNED,
	card_type_id int UNSIGNED,
	card_issued_date date,
	account_id int UNSIGNED,
	card_exp_date date NOT NULL
) AUTO_INCREMENT = 4966380000000000;

# Table structure for table "loan_status"
CREATE TABLE loan_status (
	loan_status_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	loan_status varchar(10) UNIQUE NOT NULL
);

# Table structure for table "loan"
CREATE TABLE loan (
	loan_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	account_id int UNSIGNED,
	loan_start_date date NOT NULL,
	loan_amount decimal(15, 2) UNSIGNED NOT NULL,
	loan_term smallint UNSIGNED NOT NULL,
	loan_installments decimal(15, 2) UNSIGNED NOT NULL,
	loan_status_id int UNSIGNED,
	loan_interest_rate decimal(15, 2) UNSIGNED NOT NULL,
	loan_balance decimal(15, 2) UNSIGNED NOT NULL
);

# Table structure for table "direct_debit_type"
CREATE TABLE direct_debit_type (
	dd_type_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	dd_type varchar(15) UNIQUE NOT NULL
);

# Table structure for table "direct_debit"
CREATE TABLE direct_debit (
	dd_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	account_id int UNSIGNED,
	bank_id int UNSIGNED,
	account_to varchar(50) NOT NULL,
	dd_amount decimal(15, 2) NOT NULL,
	dd_type_id int UNSIGNED,
	dd_date datetime NOT NULL
);

# Adding foreign keys to table "branch" 
ALTER TABLE
	branch
ADD
	FOREIGN KEY(address_id) REFERENCES address(address_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(district_id) REFERENCES district(district_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(region_id) REFERENCES region(region_id) ON DELETE CASCADE;

# Adding foreign keys to table "address" 
ALTER TABLE
	address
ADD
	FOREIGN KEY(district_id) REFERENCES district(district_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(region_id) REFERENCES region(region_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(postcode_id) REFERENCES postcode(postcode_id) ON DELETE CASCADE;

# Adding foreign keys to table "client_"
ALTER TABLE
	client_
ADD
	FOREIGN KEY(district_id) REFERENCES district(district_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(address_id) REFERENCES address(address_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(client_status_id) REFERENCES client_status(client_status_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(phone_id) REFERENCES phone(phone_id) ON DELETE CASCADE;

# Adding foreign keys to table "account_"
ALTER TABLE
	account_
ADD
	FOREIGN KEY(district_id) REFERENCES district(district_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(frequency_id) REFERENCES frequency(frequency_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(client_id) REFERENCES client_(client_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE;

# Adding foreign keys to table "transactions"
ALTER TABLE
	transactions
ADD
	FOREIGN KEY(account_id) REFERENCES account_(account_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(trans_type_id) REFERENCES trans_type(trans_type_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(operation_id) REFERENCES operation(operation_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(trans_k_id) REFERENCES trans_k(trans_k_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(bank_id) REFERENCES bank(bank_id) ON DELETE CASCADE;

# Addling foreign keys to table "district"
ALTER TABLE
	district
ADD
	FOREIGN KEY(region_id) REFERENCES region(region_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(demographics_id) REFERENCES demographics(demographics_id) ON DELETE CASCADE;

# Addling foreign keys to table "card"
ALTER TABLE
	card
ADD
	FOREIGN KEY(client_status_id) REFERENCES client_status(client_status_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(card_type_id) REFERENCES card_type(card_type_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(account_id) REFERENCES account_(account_id) ON DELETE CASCADE;

# Addling foreign keys to table "loan"
ALTER TABLE
	loan
ADD
	FOREIGN KEY(account_id) REFERENCES account_(account_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(loan_status_id) REFERENCES loan_status(loan_status_id) ON DELETE CASCADE;

# Addling foreign keys to table "direct_debit"
ALTER TABLE
	direct_debit
ADD
	FOREIGN KEY(bank_id) REFERENCES bank(bank_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(account_id) REFERENCES account_(account_id) ON DELETE CASCADE,
ADD
	FOREIGN KEY(dd_type_id) REFERENCES direct_debit_type(dd_type_id) ON DELETE CASCADE;

# Addling foreign keys to table "trans_k"
ALTER TABLE
	trans_k
ADD
	FOREIGN KEY(trans_id) REFERENCES transactions(trans_id) ON DELETE CASCADE;