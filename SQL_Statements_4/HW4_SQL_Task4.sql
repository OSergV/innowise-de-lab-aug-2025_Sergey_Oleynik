-- Задание 4: DML/DCL  *******************************************************************
-- Цель: Практика более сложных DML-операций с использованием предложений WHERE, множественных обновлений

-- 1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%.
UPDATE Employees 
SET Salary = Salary * 1.1 
WHERE Department = 'HR' ;

-- 2. Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.
UPDATE Employees
SET Department = 'Senior IT'
WHERE Salary > 70000 ;

-- 3. Удалить всех сотрудников, которые не назначены ни на один проект в таблице EmployeeProjects. 
--	  Подсказка: Используйте подзапрос NOT EXISTS или LEFT JOIN
DELETE FROM Employees e					-- NOT EXISTS
WHERE NOT EXISTS (
	SELECT * FROM EmployeeProjects ep 
	WHERE e.EmployeeID = ep.EmployeeID
);

DELETE FROM Employees e1				-- LEFT JOIN
WHERE e1.EmployeeID IN (
	SELECT e2.EmployeeID FROM Employees e2 
	LEFT JOIN EmployeeProjects ep ON e2.EmployeeID = ep.EmployeeID
	WHERE ep.EmployeeID IS NULL 
);

-- 4. Вставить новый проект и назначить на него двух существующих сотрудников с определенным количеством
--	  HoursWorked в EmployeeProjects, и все это в одном блоке BEGIN/COMMIT.

BEGIN;		-- Старт транзакции

	-- Вставка нового проекта
	INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate) VALUES
	('QA Testing', 175000.00, '2025-08-17', '2025-09-01');

	-- Назначение на проект двух существующих сотрудников
	INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
	((SELECT MIN(EmployeeID) FROM Employees), (SELECT MAX(ProjectID) FROM Projects), 130), 
	((SELECT MAX(EmployeeID) FROM Employees), (SELECT MAX(ProjectID) FROM Projects), 70); 
	
COMMIT;		-- Фиксация транзакции