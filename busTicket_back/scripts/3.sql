DROP TABLE IF EXISTS trips;

CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    origin_city_id INT,
    destination_city_id INT,
    date DATE NOT NULL,
    hour VARCHAR(10) NOT NULL,
    bus_id INT,
    FOREIGN KEY (origin_city_id) REFERENCES cities(id),
    FOREIGN KEY (destination_city_id) REFERENCES cities(id),
    FOREIGN KEY (bus_id) REFERENCES buses(id)
);
