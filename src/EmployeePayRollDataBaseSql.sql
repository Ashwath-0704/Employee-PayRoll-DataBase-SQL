
--UC1 :- Ability to create a payroll service database

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
