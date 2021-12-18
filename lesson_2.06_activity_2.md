# 2.06 Activity 2 / Solutions by Jorge Castro

#### Queries and questions

1. Can you use the following query:

```sql
select * from bank.district
where a3 like 'north%M%';
```

instead of:

```sql
select * from bank.district
where a3 like 'north_M%';
```

Try both the queries and check the results.


```sql
SELECT
    *
FROM
    bank.district
WHERE
    a3 LIKE 'north%M%';
```
*This query can be used if you are looking for a value which starts with north and has 
a capital M anywhere after north. This is the reason why the query brings back 
Noth Bohamia and North Moravia. The % allows you to match any string of any length
including cero length*

```sql
SELECT
    *
FROM
    bank.district
WHERE
    a3 LIKE 'north_M%';
```
*This query is more granular asking for a value that
matches north and only one character or anything of the sort but only one
then a value that starts with capital M and any character after.*


2. We looked at the following query in class:

```sql
select * from bank.district
where a2 regexp 'ch[e-r]';
```

Can you modify the query to print the rows only for those values in the **A2** column that starts with **'CH'**?

```sql
SELECT
    *
FROM
    bank.district
WHERE
    a2 REGEXP '^ch';
```



3. Use the table `trans` for this query. Use the column `type` to test: "By default, in an ascending sort, special characters appear first, followed by numbers, and then letters."

4. Again use the table `trans` for this query. Use the column `k_symbol` to test: "Null values appear first if the order is ascending."

5. Pick any table and any column to test: "You can use any column from the table to sort the values even if that column is not used in the select statement." Check the difference by writing the query with and without that column (column used to sort the results) in the select statement.
