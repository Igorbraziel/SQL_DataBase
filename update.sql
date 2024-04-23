UPDATE users SET 
users.last_name = CONCAT(users.last_name, "updated")
WHERE id BETWEEN 1 AND 10;

SELECT * FROM users
WHERE id BETWEEN 1 AND 10;