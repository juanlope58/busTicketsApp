DROP TABLE IF EXISTS cities;

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL
);

INSERT INTO cities(city_name)
VALUES
    ('MEDELLIN'),
    ('BOGOTA'),
    ('MANIZALES'),
    ('CARTAGENA');