UPDATE users SET users.salary = ROUND(RAND() * 10000, 2); 

SELECT first_name, salary 
FROM users
ORDER BY users.salary ASC;