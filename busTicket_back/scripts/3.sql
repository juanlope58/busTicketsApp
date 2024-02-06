DROP TABLE IF EXISTS buses;

CREATE TABLE buses (
    id SERIAL PRIMARY KEY,
    seats INT NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);