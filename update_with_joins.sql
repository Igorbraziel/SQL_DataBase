UPDATE users
INNER JOIN profiles
ON users.id = profiles.user_id
SET profiles.bio = CONCAT(profiles.bio, 'updated')
WHERE users.first_name = 'Igor';