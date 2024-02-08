DROP TABLE IF EXISTS trips;

CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    origin_city_id INT,
    destination_city_id INT,
    date DATE NOT NULL,
    hour VARCHAR(10) NOT NULL,
    company_id INT,
    
    FOREIGN KEY (origin_city_id) REFERENCES cities(id),
    FOREIGN KEY (destination_city_id) REFERENCES cities(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

INSERT INTO trips(origin_city_id, destination_city_id, date, hour, company_id)
VALUES
    (1,2,'2024-02-10','10:40 am',1);