-- Задание 6: DML (Optional)  *******************************************************************
-- Цель: Объединение DML-операций с JOIN, подзапросами и условной логикой.

-- 1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов.
SELECT p.ProjectName FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE e.FirstName = 'Bob' AND e.LastName = 'Johnson' AND ep.HoursWorked > 150 ;

-- 2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
UPDATE Projects p
SET Budget = Budget * 1.1
WHERE EXISTS (
    SELECT *
    FROM EmployeeProjects ep
    JOIN Employees e ON ep.EmployeeID = e.EmployeeID
    WHERE ep.ProjectID = p.ProjectID AND e.Department = 'IT'
);
SELECT * FROM Projects ;			-- проверка

UPDATE Projects p					-- 2-й вариант
SET Budget = Budget * 1.1
FROM EmployeeProjects ep
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE p.ProjectID = ep.ProjectID AND e.Department = 'IT';

-- 3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установить EndDate на один год позже его StartDate.
UPDATE Projects 
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL ;

-- 4. Вставить нового сотрудника и немедленно назначить его на проект 'Website Redesign' с 80 отработанными часами, все в
--	  рамках одной транзакции. Использовать предложение RETURNING, чтобы получить EmployeeID вновь вставленного сотрудника.

DO $$		-- Начало анонимного блока, который в PostgreSQL является транзакцией
DECLARE
    New_EmpID INTEGER;
BEGIN
    -- Вставка сотрудника и сохранение его EmployeeID в переменную
    INSERT INTO Employees (FirstName, LastName, Department, Salary, Email) VALUES 
	('NewSotrudnik+', 'NewSotrudnikoff+', 'Devops', 77000.00, 
	CONCAT('NewSotrudnikoff+', (SELECT MAX(EmployeeID) FROM Employees)+1, '@organization.com'))
    RETURNING EmployeeID INTO New_EmpID ;

    -- Добавление нового сотрудника в проект
    INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES 
	(New_EmpID, (SELECT ProjectID FROM Projects WHERE ProjectName = 'Website Redesign'), 88);
END $$;		-- Конец транзакции