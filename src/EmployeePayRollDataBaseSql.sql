
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


--UC3 :- Ability to create employee payroll data in the payroll service database as part of CRUD Operation

mysql> INSERT INTO employee_payroll (id,name,start_date,salary) values (1,'Ashwath','2022-1-12',2000);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM employee_payroll;
+----+---------+------------+--------+
| id | name    | start_date | salary |
+----+---------+------------+--------+
|  1 | Ashwath | 2022-01-12 |   2000 |
+----+---------+------------+--------+
1 row in set (0.00 sec)

mysql> INSERT INTO employee_payroll (id,name,start_date,salary) values(2,'Gouthum','2022-1-12',3000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll (id,name,start_date,salary) values(3,'Anusha','2022-1-12',5000);
Query OK, 1 row affected (0.01 sec)


-- UC4 :- Ability to retrieve all the employee payroll data that is added to payroll service database

mysql> SELECT * FROM employee_payroll;
+----+---------+------------+--------+
| id | name    | start_date | salary |
+----+---------+------------+--------+
|  1 | Ashwath | 2022-01-12 |   2000 |
|  2 | Gouthum | 2022-01-12 |   3000 |
|  3 | Anusha  | 2022-01-12 |   5000 |
+----+---------+------------+--------+

--UC5 :- Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database

mysql> SELECT salary FROM employee_payroll
    -> WHERE name = 'Ashwath';
+--------+
| salary |
+--------+
|   2000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start_date between CAST('2022-01-12' as DATE) and DATE(NOW());
+----+---------+------------+--------+
| id | name    | start_date | salary |
+----+---------+------------+--------+
|  1 | Ashwath | 2022-01-12 |   2000 |
|  2 | Gouthum | 2022-01-12 |   3000 |
|  3 | Anusha  | 2022-01-12 |   5000 |
+----+---------+------------+--------+
3 rows in set (0.00 sec)

-- UC6 :- Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender

mysql> alter table employee_payroll add gender char(1) not null after name;
Query OK, 0 rows affected (0.20 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC employee_payroll;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int         | NO   | PRI | NULL    |       |
| name       | varchar(20) | NO   |     | NULL    |       |
| gender     | char(1)     | NO   |     | NULL    |       |
| start_date | date        | YES  |     | NULL    |       |
| salary     | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> UPDATE employee_payroll
    -> set gender ='M' where name = 'Bill' or name ='Ashwath';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DESC employee_payroll;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int         | NO   | PRI | NULL    |       |
| name       | varchar(20) | NO   |     | NULL    |       |
| gender     | char(1)     | NO   |     | NULL    |       |
| start_date | date        | YES  |     | NULL    |       |
| salary     | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+------------+--------+
| id | name    | gender | start_date | salary |
+----+---------+--------+------------+--------+
|  1 | Ashwath | M      | 2022-01-12 |   2000 |
|  2 | Gouthum |        | 2022-01-12 |   3000 |
|  3 | Anusha  |        | 2022-01-12 |   5000 |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Gouthum';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Anusha';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+------------+--------+
| id | name    | gender | start_date | salary |
+----+---------+--------+------------+--------+
|  1 | Ashwath | M      | 2022-01-12 |   2000 |
|  2 | Gouthum | M      | 2022-01-12 |   3000 |
|  3 | Anusha  | F      | 2022-01-12 |   5000 |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)

-- UC7 :- Ability to find sum, average, min, max and number of male and female employees

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|        5000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(id) FROM employee_payroll WHERE gender = 'M';
+-----------+
| COUNT(id) |
+-----------+
|         2 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(id) FROM employee_payroll WHERE gender = 'M' GROUP BY salary;
+-----------+
| COUNT(id) |
+-----------+
|         1 |
|         1 |
+-----------+
2 rows in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY id;
+-------------+
| AVG(salary) |
+-------------+
|   2000.0000 |
|   3000.0000 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'M' ;
+-------------+
| MAX(salary) |
+-------------+
|        3000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(gender) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+---------------+
| COUNT(gender) |
+---------------+
|             2 |
+---------------+
1 row in set (0.00 sec)

-- UC8 :- Ability to extend employee_payroll data to store employee information like employee phone, address and department

-- UC9 :- Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay

mysql> INSERT INTO employee_payroll
    ->        (Employee_ID,EmployeeName,PhoneNumber,Address,Department,BasicPay,Deductions,TaxablePay,Tax,NetPay,City,Country,gender,start_date,salary)
    ->        VALUES
    ->        (4,'Ashwath_Naidu','90086xxxx','Near_Sai_baba_Temple_raod,Kundhanalli_Gate','Java_Developer',18000,2000,1000,2000,13000,'Bengaluru','India','M','2021-8-10',25000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll
    ->        (Employee_ID,EmployeeName,PhoneNumber,Address,Department,BasicPay,Deductions,TaxablePay,Tax,NetPay,City,Country,gender,start_date,salary)
    ->        VALUES
    ->        (5,'Gouthum','808886xxxx','Near_Sai_baba_Temple_raod,Kundhanalli_Gate','Marketing Team',25000,5000,2000,3000,5000,'Bengaluru','India','M','2021-10-25',35000);
Query OK, 1 row affected (0.01 sec)

-- UC10 :- Ability to make Terissa as part of Sales and Marketing Department

mysql> INSERT INTO employee_payroll
    ->        (Employee_ID,EmployeeName,PhoneNumber,Address,Department,BasicPay,Deductions,TaxablePay,Tax,NetPay,City,Country,gender,start_date,salary)
    ->        VALUES
    ->        (6,'Terissa','808886xxxx','Near_RT Nager,Kundhanalli_Gate','Marketing Team',25000,5000,2000,3000,5000,'Bengaluru','India','M','2021-10-25',35000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll
    ->        (Employee_ID,EmployeeName,PhoneNumber,Address,Department,BasicPay,Deductions,TaxablePay,Tax,NetPay,City,Country,gender,start_date,salary)
    ->        VALUES
    ->        (7,'Terissa','808886xxxx','Near_RT Nager,Kundhanalli_Gate','Sale Department',25000,5000,2000,3000,5000,'Bengaluru','India','M','2021-10-25',35000);
Query OK, 1 row affected (0.01 sec)

mysql>     SELECT * FROM employee_payroll;
+-------------+---------------+-------------+--------------------------------------------+-----------------+----------+------------+------------+------+--------+-----------+---------+--------+------------+--------+
| Employee_ID | EmployeeName  | PhoneNumber | Address                                    | Department      | BasicPay | Deductions | TaxablePay | Tax  | NetPay | City      | Country | gender | start_date | salary |
+-------------+---------------+-------------+--------------------------------------------+-----------------+----------+------------+------------+------+--------+-----------+---------+--------+------------+--------+
|           1 | Ashwath       | NULL        | NULL                                       | NULL            |     NULL |       NULL |       NULL | NULL |   NULL | NULL      | NULL    | M      | 2022-01-12 |   2000 |
|           2 | Gouthum       | NULL        | NULL                                       | NULL            |     NULL |       NULL |       NULL | NULL |   NULL | NULL      | NULL    | M      | 2022-01-12 |   3000 |
|           3 | Anusha        | NULL        | NULL                                       | NULL            |     NULL |       NULL |       NULL | NULL |   NULL | NULL      | NULL    | F      | 2022-01-12 |   5000 |
|           4 | Ashwath_Naidu | 90086xxxx   | Near_Sai_baba_Temple_raod,Kundhanalli_Gate | Java_Developer  |    18000 |       2000 |       1000 | 2000 |  13000 | Bengaluru | India   | M      | 2021-08-10 |  25000 |
|           5 | Gouthum       | 808886xxxx  | Near_Sai_baba_Temple_raod,Kundhanalli_Gate | Marketing Team  |    25000 |       5000 |       2000 | 3000 |   5000 | Bengaluru | India   | M      | 2021-10-25 |  35000 |
|           6 | Terissa       | 808886xxxx  | Near_RT Nager,Kundhanalli_Gate             | Marketing Team  |    25000 |       5000 |       2000 | 3000 |   5000 | Bengaluru | India   | M      | 2021-10-25 |  35000 |
|           7 | Terissa       | 808886xxxx  | Near_RT Nager,Kundhanalli_Gate             | Sale Department |    25000 |       5000 |       2000 | 3000 |   5000 | Bengaluru | India   | M      | 2021-10-25 |  35000 |
+-------------+---------------+-------------+--------------------------------------------+-----------------+----------+------------+------------+------+--------+-----------+---------+--------+------------+--------+
7 rows in set (0.00 sec)
