-- 7. Найдите клиентов, которые:
--		1. Сделали хотя бы 2 заказа (любых),
--		2. Имеют хотя бы одну доставку со статусом 'Delivered'.
--	  Для каждого такого клиента выведите:
--		● full_name (имя + фамилия),
--		● общее количество заказов,
--		● общую сумму заказов,
--		● страну проживания.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name, c.country, 
	COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_amount
FROM Customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN shippings s ON o.customer_id = s.customer 
WHERE s.status = 'Delivered'
GROUP BY full_name, c.country
HAVING COUNT(o.order_id) > 1 ;

-- Кирилл, мне кажется, что в этой базе данных не совсем верная структура!!!
-- В таблице Shippings вместо поля Customer д.б. поле Order_ID (FK) связанное с Order_ID (PK) в таблице Orders.
-- А иначе из таблицы Shippings не возможно понять по какому конкретно заказу была доставка и какой у нее статус.
-- И если в таблице Shippings будет поле Order_ID, то данные из нее будут связаны с данными из таблицы Customers 
-- через таблицу Orders.

-- И я не совсем уверен в правильности этого своего запроса, хотя он и сошелся с результатом в вашем задании )))