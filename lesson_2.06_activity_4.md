# 2.06 Activity 4

1. Check if referential integrity is followed in the following tables?

![Referential Integrity Constraint Check](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/2.5-referential_integrity_constraint.png)



*Referential integrity is a set of rules that ensures that table relationships are consistent. Because each database table must have a primary key, it may appear in other tables as a result of its connection to data within those tables. A foreign key is one type of relationship between tables. In this case the rule is being followed as the CompanyID is being refered on the InsuranceCompany table as a foreign key.*



2. Now use the `bank` database to make the following changes:

      a. Use the insert command to create a new entry in the `loan` table with the following values (8000,8000000,930705,96396,12,8033.0,'C'). Here each element corresponds to the values in columns in the table (in the order the columns appear in the table). This might raise an error. Why is that?


```sql
INSERT INTO
    loan
VALUES
    (8000, 8000000, 930705, 96396, 12, 8033.0, 'C');
```
*I was able to insert the values succesfully.*


      b. Use the delete command to delete an entry from the 
      table account where the `account_id` is `11382`. Does 
      this result in an error? If it does, then why?

```sql
DELETE FROM
    account
WHERE
    account_id = 11382;
```
 
      
 
3. Create the rest of the tables in the `bank` database (at least the `client` and the `card` tables)

4. Design and create a new database structure. Justify your changes.
      - Some ideas include renaming columns to ones that make more sense and, for eg., in the table `district`, adding foreign keys wherever necessary.

# Answer:
<br></br>

This is the original database bank schema:
<br></br>

![image](https://user-images.githubusercontent.com/63274055/146789480-b697927e-a6e2-42f7-a76d-aa0e67dfb496.png)
<br></br>


The following are the improvements I made to the schema:

* Only 1 out of 8 tables had a Primary Key and there are no NOT NULL constrains. This can potencialy allow data duplication.
To start normalizing the database, I have given every column a Primary Key.
<br></br>
![image](https://user-images.githubusercontent.com/63274055/146806057-8ffabf24-4cdf-499f-95ba-cdd7553cb6d4.png)
<br></br>

* Implemented the use of Foreign Keys which minimises data redundancy as there are many atributes (columns) that are
and can be used in other tables. Also this avoids having two attributs with the same name.
For example in ```sql bank.trans.k_symbol``` and ```sql bank.order.k_symbol```, both describle the nature of the transaction, the first its for "transactions" and the second for Direct Debits which in the database are refered as Orders or permanent orders.

* The entity "order" has been renamed to "direct_debit", as it is more meaningful as "order" has a implicit congnotation to orders on a online store.

* As the transaction types are quite extensive on both tables, they have created in a different table and the transacion types and direct debit types are now
* reffered onto the transactions and direct_debit tables by Foreign Keys.

![image](https://user-images.githubusercontent.com/63274055/146812914-cfc29fe8-c72a-4d30-8164-bd51985f218a.png)


<br></br>
![image](https://user-images.githubusercontent.com/63274055/146808023-340a2ae2-d946-450c-821c-82944ed79460.png)




.






