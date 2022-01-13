
--UC1 :- Ability to create a payroll service database

No connection. Trying to reconnect...
Enter password: ***********
Connection id:    15
Current database: *** NONE ***


+--------------------+
| Database           |
+--------------------+
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (14.00 sec)

mysql> create database payrool_service;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo               |
| information_schema |
| mysql              |
| payrool_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use payrool_service;
Database changed
mysql> show tables;
Empty set (0.03 sec)

-- UC2 :- Ability to create a employee payroll table in the payroll service database to manage employee payrolls

mysql>  create table employee_payroll
    ->      (id int(10) primary key,
    ->      name varchar(20) not null,
    ->      start_date DATE,
    ->      salary int);
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> desc employee_payroll;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int         | NO   | PRI | NULL    |       |
| name       | varchar(20) | NO   |     | NULL    |       |
| start_date | date        | YES  |     | NULL    |       |
| salary     | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)
