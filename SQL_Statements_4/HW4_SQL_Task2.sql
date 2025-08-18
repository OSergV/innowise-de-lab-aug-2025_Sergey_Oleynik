-- Задание 2: DDL  *******************************************************************
-- Цель: Практика создания и изменения структуры таблиц.

-- 1. Создать новую таблицу с именем Departments со столбцами: 
--	  DepartmentID (SERIAL PRIMARY KEY), DepartmentName (VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)).
CREATE TABLE Departments (
DepartmentID SERIAL PRIMARY KEY,
DepartmentName VARCHAR(50) UNIQUE NOT NULL,
Location VARCHAR(50)
);

-- 2. Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)).
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100) ;

-- 3. Добавить ограничение UNIQUE к столбцу Email в таблице Employees, предварительно заполнив любыми значениями
UPDATE Employees
SET Email = CONCAT(LastName, EmployeeID, '@organization.com')
WHERE Email IS NULL ;

ALTER TABLE Employees
ADD CONSTRAINT UQ_Email UNIQUE (Email) ;

-- 4. Переименовать столбец Location в таблице Departments в OfficeLocation.
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation ;