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
![image](https://user-images.githubusercontent.com/63274055/146673958-3cf79587-6160-458f-bcdb-8c1fb0bfec04.png)


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
![image](https://user-images.githubusercontent.com/63274055/146674008-ea99725a-ce60-4ee1-8c49-4751ea79e2df.png)


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
![image](https://user-images.githubusercontent.com/63274055/146674040-85bb136d-347f-4b76-aa47-f07bc7931814.png)

   

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
![image](https://user-images.githubusercontent.com/63274055/146674051-f96cd607-6015-460b-a46b-f8653b62a8e2.png)
   

1. Find the different values from the field `A2` that end with the letter 'K'.

```sql
SELECT
    A2
FROM
    district
WHERE
    A2 REGEXP 'K$';
```
![image](https://user-images.githubusercontent.com/63274055/146674071-f0a07646-39f2-4089-8cca-dc46892edaa1.png)


6. Discuss the possible use cases of using regular expressions in your query.

    *MySQL Regular expressions allow us to search data matching even more complex criterion.*
