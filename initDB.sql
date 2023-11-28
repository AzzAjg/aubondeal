-- CREATE DATABASE aubondeal;

CREATE TABLE IF NOT EXISTS Products (
    product_UUID SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_description TEXT,
    product_price INTEGER NOT NULL CHECK (product_price > 0), 
    product_quantity INTEGER NOT NULL CHECK (product_quantity > 0),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Users (
    user_UUID  SERIAL PRIMARY KEY,
    user_pseudo VARCHAR(50) NOT NULL, 
    username VARCHAR(50) UNIQUE NOT NULL, 
    user_password VARCHAR(50) NOT NULL CHECK (char_length(user_password) > 8),
    created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Orders (
    order_number SERIAL PRIMARY KEY,
    user_UUID SERIAL REFERENCES Users(user_UUID),
    order_total_cost_ht INTEGER NOT NULL CHECK (order_total_cost_ht > 0),
    order_total_quantity INTEGER NOT NULL CHECK (order_total_quantity > 0),
    created_at TIMESTAMP,
    deliver_atO TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Belong (
    product_UUID SERIAL REFERENCES Products(product_UUID),
    order_number SERIAL REFERENCES Orders(order_number),
    PRIMARY KEY(product_UUID,order_number)
);