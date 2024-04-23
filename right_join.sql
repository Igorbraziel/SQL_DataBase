SELECT users.id as uid, profiles.id as pid
FROM users
RIGHT JOIN profiles
ON users.id = profiles.user_id