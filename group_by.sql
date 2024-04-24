SELECT first_name, COUNT(id) as total
FROM users
GROUP BY first_name
ORDER BY total DESC
