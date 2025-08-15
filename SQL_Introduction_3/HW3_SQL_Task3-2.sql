-- 3.2 Посчитайте общее количество заказов и среднюю сумму по каждому товару.
SELECT item, COUNT(item) AS count, ROUND(AVG(amount),2) AS avg_amount
FROM Orders 
GROUP BY item ;
