DROP TABLE IF EXISTS seats;

CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    bus_id INT,
    isAvailable BOOLEAN NOT NULL,
    identifier VARCHAR(10) NOT NULL,
    FOREIGN KEY (bus_id) REFERENCES buses(id)
);
