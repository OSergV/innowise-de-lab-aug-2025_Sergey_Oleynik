   -- Задание 1: DML  *******************************************************************
-- Цель: Практика базовой вставки, выборки, простого обновления и удаления данных.

-- 1. Вставить двух новых сотрудников в таблицу Employees.
INSERT INTO Employees (FirstName, LastName, Department, Salary) VALUES
('Ivan', 'Ivanov', 'Devops', 70000.00),
('Petr', 'Petrov', 'QA', 55000.00);

-- 2. Выбрать всех сотрудников из таблицы Employees.
SELECT FirstName, LastName 
FROM Employees ;

-- 3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'.
SELECT FirstName, LastName 
FROM Employees 
WHERE Department = 'IT' ;

-- 4. Обновить Salary 'Alice Smith' до 65000.00.
UPDATE Employees 
SET Salary = 65000
WHERE FirstName = 'Alice' AND LastName = 'Smith' ;

-- 5. Удалить сотрудника, чья LastName — 'Prince'.
DELETE FROM EmployeeProjects 
WHERE EmployeeID = (
	SELECT EmployeeID
	FROM Employees
	WHERE LastName = 'Prince'
	);
DELETE FROM Employees 
WHERE LastName = 'Prince' ;

-- 6. Проверить все изменения, используя SELECT * FROM Employees;
SELECT * FROM Employees ;