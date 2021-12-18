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


      b. Use the delete command to delete an entry from the table account where the `account_id` is `11382`. Does this result in an error? If it does, then why?

```sql
DELETE FROM
    account
WHERE
    account_id = 11382;
```

      
 
3. Create the rest of the tables in the `bank` database (at least the `client` and the `card` tables)

4. Design and create a new database structure. Justify your changes.
      - Some ideas include renaming columns to ones that make more sense and, for eg., in the table `district`, adding foreign keys wherever necessary.

