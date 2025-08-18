-- Задание 3: DCL  *******************************************************************
-- Цель: Научиться создавать пользователей (роли в PostgreSQL) и предоставлять/отзывать базовые разрешения.

-- 1. Создать нового пользователя PostgreSQL (роль) с именем hr_user и простым паролем.
CREATE USER hr_user WITH PASSWORD 'password1' ;

-- 2. Предоставить hr_user право SELECT на таблицу Employees.
CREATE ROLE table_Employees ;						-- создаем роль
GRANT SELECT ON Employees TO table_Employees ;		-- даем роли права
GRANT table_Employees TO hr_user ;					-- назначаем роль пользователю

-- 3. Тест: В новой сессии подключиться как hr_user и попытаться выполнить SELECT * FROM Employees;. (Должно сработать).
SELECT * FROM Employees ;

-- 4. Как hr_user, попытаться выполнить INSERT нового сотрудника в Employees. (Должно завершиться неудачей).
INSERT INTO Employees (FirstName, LastName, Department, Salary, Email) VALUES
('Sidor', 'Sidorov', 'QA', 45000.00, CONCAT('Sidorov', (SELECT MAX(EmployeeID) FROM Employees)+1, '@organization.com')) ;

-- 5. Как пользователь-администратор, предоставить hr_user права INSERT и UPDATE на таблицу Employees.
GRANT SELECT, INSERT, UPDATE ON Employees TO table_Employees ;	-- даем роли права
GRANT USAGE, SELECT ON SEQUENCE employees_employeeid_seq TO table_Employees ;	-- даем роли права на последовательность

-- 6. Тест: Как hr_user, попробовать выполнить INSERT и UPDATE сотрудника. (Теперь должно сработать).
INSERT INTO Employees (FirstName, LastName, Department, Salary, Email) VALUES
('Sidor+', 'Sidorov+', 'QA+', 47000.00, CONCAT('Sidorov+', (SELECT MAX(EmployeeID) FROM Employees)+1, '@organization.com')) ;

UPDATE Employees 
SET Salary = 53000
WHERE FirstName = 'Sidor+' AND LastName = 'Sidorov+' ;