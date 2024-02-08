DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    trip_id INT,
    user_id INT,
    seat_id INT,
    FOREIGN KEY (trip_id) REFERENCES trips(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id)
);

INSERT INTO bookings(trip_id, user_id, seat_id)
VALUES
    (1,1,1)