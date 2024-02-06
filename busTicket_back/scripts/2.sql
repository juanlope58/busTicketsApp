DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);