SELECT users.id as uid, profiles.id as pid
FROM users, profiles
WHERE users.id = profiles.user_id;