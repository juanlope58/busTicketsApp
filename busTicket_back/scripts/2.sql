DROP TABLE IF EXISTS buses;

CREATE TABLE buses (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    seats INT NOT NULL
);
