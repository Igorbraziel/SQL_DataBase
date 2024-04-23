USE base_de_dados;

SELECT first_name, last_name FROM users
WHERE users.id <= 5 or users.first_name = "Nine";
