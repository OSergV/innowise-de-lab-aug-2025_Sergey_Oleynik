-- 3.1 Подсчитайте количество клиентов в каждой стране.
SELECT country, COUNT(country) AS count
FROM Customers
GROUP BY country ;

-- С вашим результатом не сошлось, но такого как у вас и не может быть )))