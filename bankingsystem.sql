DROP DATABASE bankingsystem;
CREATE DATABASE bankingsystem;

USE bankingsystem;

CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    mobile_no VARCHAR(15) NOT NULL,
    email_id VARCHAR(100) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    initial_balance DECIMAL(10, 2) NOT NULL CHECK (initial_balance >= 1000),
    date_of_birth DATE NOT NULL,
    id_proof VARCHAR(100) NOT NULL,
    account_no VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
select*from customer;
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    type ENUM('Deposit', 'Withdraw') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
INSERT INTO admin VALUES('1','anu','12');
