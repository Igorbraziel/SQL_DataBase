SELECT users.id, users.first_name, profiles.bio, roles.name
FROM users
LEFT JOIN profiles ON users.id = profiles.user_id
INNER JOIN users_roles ON users.id = users_roles.user_id
INNER JOIN roles ON users_roles.role_id = roles.id
ORDER BY users.id ASC;