-- 1) Insira 5 usuários

INSERT INTO users 
(first_name, last_name, email, password_hash, salary)
VALUES
("Igor", "Braziel", "igor1.com", ROUND(RAND() * 10000), ROUND(RAND() * 1000, 2)),
("Nine", "Braziel", "nine2.com", ROUND(RAND() * 10000), ROUND(RAND() * 1000, 2)),
("Isabela", "Braziel", "isabela3.com", ROUND(RAND() * 10000), ROUND(RAND() * 1000, 2)),
("Leda", "Braziel", "leda4.com", ROUND(RAND() * 10000), ROUND(RAND() * 1000, 2)),
("Ronaldo", "Braziel", "ronaldo5.com", ROUND(RAND() * 10000), ROUND(RAND() * 1000, 2));

-- 2) Insira 5 perfís para os usuários inseridos

INSERT INTO profiles
(profiles.bio, profiles.description, profiles.user_id)
SELECT 
CONCAT('Bio from ', users.first_name), 
CONCAT('Description from ', users.last_name), 
users.id
FROM users
ORDER BY users.id DESC
LIMIT 5;

-- 3) Insira permissões (roles) para os usuários inseridos

INSERT INTO users_roles
(users_roles.user_id, users_roles.role_id)
SELECT users.id, (SELECT id FROM roles ORDER BY RAND() LIMIT 1)
FROM users
ORDER BY users.id DESC
LIMIT 5;

-- 4) Selecione os últimos 5 usuários por ordem decrescente

SELECT * FROM users
ORDER BY id DESC
LIMIT 5;

-- 5) Atualize o último usuário inserido

UPDATE users SET users.last_name = "last_name changed"
WHERE id = 115;

-- 6) Remova uma permissão de algum usuário

DELETE FROM users_roles
WHERE user_id = (SELECT id FROM users ORDER BY id DESC LIMIT 1) AND
role_id = (SELECT id FROM roles WHERE name = 'POST');

-- 7) Remova um usuário que tem a permissão "PUT"

DELETE FROM users
WHERE id = (SELECT user_id FROM users_roles WHERE role_id = 3 ORDER BY user_id DESC LIMIT 1);

-- 8) Selecione usuários com perfís e permissões (obrigatório)

SELECT u.id as uid, u.first_name as fn, r.name as role, p.bio as bio FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
INNER JOIN users_roles as ur
ON u.id = ur.user_id
INNER JOIN roles as r
ON r.id = ur.role_id
ORDER BY u.id ASC;

-- 9) Selecione usuários com perfís e permissões (opcional)

SELECT u.id as uid, u.first_name as fn, r.name as role, p.bio as bio FROM users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
LEFT JOIN users_roles as ur
ON u.id = ur.user_id
LEFT JOIN roles as r
ON r.id = ur.role_id
ORDER BY u.id ASC;

-- 10) Selecione usuários com perfís e permissões ordenando por salário

SELECT u.id as uid, u.first_name as fn, r.name as role, u.salary as salary FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
INNER JOIN users_roles as ur
ON u.id = ur.user_id
INNER JOIN roles as r
ON r.id = ur.role_id
ORDER BY u.salary DESC;