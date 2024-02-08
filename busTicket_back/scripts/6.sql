DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    rol VARCHAR(10) NOT NULL CHECK (rol IN ('user', 'admin'))
);

INSERT INTO users(name, username, password, email, rol)
VALUES
    ('Juan Carlos','juanlope','1234','email@email.com','user'),
    ('Carolina','caro','1234','email@email.com','user'),
    ('Manuela','manu','1234','email@email.com','user'),
    ('Ximena','xime','1234','email@email.com','admin');