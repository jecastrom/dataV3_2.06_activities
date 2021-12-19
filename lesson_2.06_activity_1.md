# 2.06 Activity 1 / Solutions by Jorge Castro



Keep working on the `bank` database and its `card` table.

#### Queries

1. Get different card types.
   
```sql
SELECT
    DISTINCT TYPE
FROM
    card;
```



2. Get transactions in the first 15 days of 1993.

```sql
SELECT
    *
FROM
    trans
WHERE
    date BETWEEN 930101
    AND 930115;
```

3. Get all running loans.


    *In the database doc running loans are described as:
	Status 'C': stands for running contract, OK so far.*

```sql
SELECT
    *
FROM
    loan
WHERE
    STATUS = 'C';
```

   

1. Find the different values from the field `A2` that start with the letter 'K'.

    *Here we can use the REGEXP (regular expressions) to help with the search 
    of data matching complex criteria*

```sql
SELECT
    A2
FROM
    district
WHERE
    A2 REGEXP '^K';
```
   

1. Find the different values from the field `A2` that end with the letter 'K'.

```sql
SELECT
    A2
FROM
    district
WHERE
    A2 REGEXP 'K$';
```
   

6. Discuss the possible use cases of using regular expressions in your query.

    *MySQL Regular expressions allow us to search data matching even more complex criterion.*
