DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

INSERT INTO companies(company_name)
VALUES
    ('COONORTE'),
    ('YAMEYA'),
    ('COOTRAYAL'),
    ('RAPIDO OCHOA');