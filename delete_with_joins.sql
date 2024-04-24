DELETE profiles, users
FROM users
INNER JOIN profiles
ON users.id = profiles.user_id
WHERE users.first_name = 'Igor';