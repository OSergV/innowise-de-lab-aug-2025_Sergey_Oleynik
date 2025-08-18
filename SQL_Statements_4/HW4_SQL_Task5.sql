-- Задание 5: Функции и представления  *******************************************************************
-- Цель: Понять и создать простые SQL-функции и представления в PostgreSQL.

-- 1. Функция: Создать функцию PostgreSQL с именем CalculateAnnualBonus, которая принимает employee_id и Salary
--	  в качестве входных данных и возвращает рассчитанную сумму бонуса (10 % от Salary) для этого сотрудника. 
--	  Используйте PL/pgSQL для тела функции.

CREATE OR REPLACE FUNCTION CalculateAnnualBonus (
    Employee_ID INTEGER,
    Salary NUMERIC
)
RETURNS NUMERIC 
LANGUAGE plpgsql
AS $$
DECLARE
    Bonus NUMERIC;
BEGIN
    Bonus := Salary * 0.1;
    RETURN Bonus;
END;
$$;

-- 2. Использовать эту функцию в операторе SELECT, чтобы увидеть потенциальный бонус для каждого сотрудника.
SELECT CalculateAnnualBonus(EmployeeID, Salary)
FROM Employees;

-- 3. Представление (View): Создать представление с именем IT_Department_View, которое показывает
--	  EmployeeID, FirstName, LastName и Salary только для сотрудников из отдела 'IT'.
CREATE VIEW IT_Department_View AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees 
WHERE Department = 'IT' ;

-- 4. Выбрать данные из вашего представления IT_Department_View.
SELECT * FROM IT_Department_View ;