--UC1
Create Database EmployeePayroll_Service
use EmployeePayroll_Service

-------to create a table --UC2---
Create Table employee_payroll
(
	Id int IDENTITY(1,1) NOT NULL Primary Key,
	Name varchar(50) NOT NULL,
	Salary money NOT NULL,
	Start Date NOT NULL
)

Select * From employee_payroll
Exec sp_help employee_payroll

--UC3-----to insert data into the table--------------
INSERT Into employee_payroll (Name, Salary, Start) Values ('Bill', 1000000, '2018-01-03')
INSERT Into employee_payroll (Name, Salary, Start) Values ('Terisa', 2000000, '2019-11-13')
INSERT Into employee_payroll (Name, Salary, Start) Values ('Charlie', 3000000, '2020-05-21')

--UC4----retrive data
Select * From employee_payroll


--UC5-- retrive according to the start date range-------------
----------CAST METHOD USED FOR CONVERTING VARIALBLE TO THE DATA TYPE----------
Select Name,Salary From employee_payroll Where Name = 'Bill'
Select * From employee_payroll Where Start BETWEEN CAST('2018-01-03' AS DATE) AND GETDATE()


--UC6---we have to add the other column as a gender tocexisting table------------

ALTER Table employee_payroll ADD Gender char(1)
Update employee_payroll Set Gender = 'M' Where Name = 'Bill' or Name = 'Charlie'
Update employee_payroll Set Gender = 'F' Where Name = 'Terisa'
Update employee_payroll Set Salary = 3000000 Where Name = 'Terisa'
Select * From employee_payroll

--UC7--sum,avrage,min,max,count------------------
Select AVG(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select AVG(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select SUM(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select SUM(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select MIN(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select MIN(Salary) From employee_payroll Where Gender = 'F' Group By Gender
Select MAX(Salary) From employee_payroll Where Gender = 'M' Group By Gender
Select MAX(Salary) From employee_payroll Where Gender = 'F' Group By Gender


