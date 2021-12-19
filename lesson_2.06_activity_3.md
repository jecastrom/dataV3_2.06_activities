# 2.06 Activity 3

--1 
During the lesson, we mentioned that one of the primary reasons for normalizing tables is to eliminate data redundancy. Otherwise, data redundancy can result in highly inefficient data storages. Which other problems you may think non-normalized structure may have?

The students can refer to the following link to read more about normalization, its advantages and disadvantages. (https://whatisdbms.com/normalization-in-dbms-anomalies-advantages-disadvantages/)


Answer:


*When several instances of the same data are scattered across different tables without proper 
relationship/link, it can cause strange conditions where some will get updated with new values 
whereas others won't. This leaves our database in an inconsistent state!*

-- 2
Later in the labs we will use another database that models a DVD rental store. ERD (entity relationship diagram) for the database is shown below. You can refer the file `sakila-schema.pdf` in the files_for_activities folder as well.

[./files_for_activities/sakila-schema.pdf]

### Questions

- Identify the primary keys and foreign keys from the ER diagram.

*Answer:*

![image](https://user-images.githubusercontent.com/63274055/146691318-d9e34136-e026-4e08-9fa3-c15fa66f866d.png)
![image](https://user-images.githubusercontent.com/63274055/146691339-48da0310-898d-4234-85e6-8002382902af.png)

[Sakila Primary Keys.pdf](https://github.com/jecastrom/dataV3_2.06_activities/files/7741626/Sakila.Primary.Keys.pdf)

[Sakila Foreign Keys.pdf](https://github.com/jecastrom/dataV3_2.06_activities/files/7741627/Sakila.Foreign.Keys.pdf)
.


