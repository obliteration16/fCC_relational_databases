CREATE DATABASE salon;

\c salon;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT,
    service_id INT,
    time VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

INSERT INTO services VALUES (1, 'cut'  ), (2, 'color'), (3, 'perm' ), 
(4, 'style'), (5, 'trim');