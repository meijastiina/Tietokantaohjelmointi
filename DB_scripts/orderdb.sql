drop database if exists productdb;
create database productdb;
use productdb;


CREATE TABLE customer(
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50) NOT NULL,
    lastname varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customer_order(
    order_id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE category(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE product(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    category_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);


CREATE TABLE order_product(
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO customer (firstname, lastname) VALUES 
    ("John", "Doe"), ("Lisa", "Simpson"), ("Marco", "Polo"), ("Donald", "Duck"),
    ("Julia", "Roberts"), ("Mandy", "Monroe"), ("Jack", "Black");
    
INSERT INTO category (name) VALUES
    ("Audio"), ("Cables"), ("Cameras"), ("Software"), ("Phones");

INSERT INTO product (name, category_id) VALUES
    ("Airpods", 1), ( "Sennheiser PC 8", 1), ( "Genelec G One B", 1),
    ("Yamaha WXC-50", 1), ( "JBL Flip Essential", 1),( "Jabra Speak 410", 1),
    ("Deltaco CAT5e", 2),( "HAMA RCA", 2),( "Deltaco TOSLINK", 2),( "HAMA XLR", 2),
    ("Canon EOS 500D", 3), ( "Canon RF 24--70mm", 3), ( "Sigma 24-70mm", 3),
    ("GoPro HERO9", 3), ( "Adobe Photoshop", 4), ( "F-secure Total", 4),
    ("Windows 10 Home", 4), ( "OnePlust Nord 2", 5), ( "Google Pixel 4a", 5),
    ("Samsung Galaxy A22", 5);

INSERT INTO customer_order (customer_id) VALUES
    ( 1), ( 2), ( 3);

INSERT INTO order_product (order_id, product_id, quantity) VALUES
    (1, 1, 4), (1, 5, 2), (1, 8, 1),
    (2, 4, 1), (2, 5, 1), 
    (3, 12, 1), (3, 15, 1), (3, 11, 3);
    
    