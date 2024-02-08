DROP TABLE IF EXISTS seats;

CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    is_available BOOLEAN NOT NULL,
    identifier VARCHAR(10) NOT NULL,
    trip_id INT,
    FOREIGN KEY (trip_id) REFERENCES trips(id)
);

INSERT INTO seats(is_available, identifier, trip_id)
VALUES
    (false,'P1',1),
    (true,'P2',1),
    (true,'P3',1),
    (true,'P4',1),
    (true,'P5',1),
    (true,'P6',1),
    (true,'P7',1),
    (true,'P8',1),
    (true,'P9',1),
    (true,'P10',1);