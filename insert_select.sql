INSERT INTO profiles 
(profiles.bio, profiles.description, profiles.user_id)
SELECT 
CONCAT("Bio de ", users.first_name),
CONCAT("Description de ", users.first_name),
users.id 
FROM users;