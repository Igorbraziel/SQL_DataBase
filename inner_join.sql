SELECT users.id as uid, profiles.id as pid,
users.first_name, profiles.bio 
FROM users
INNER JOIN profiles
ON users.id = profiles.user_id 
WHERE users.first_name LIKE "i%"
ORDER BY users.first_name ASC 
LIMIT 10;