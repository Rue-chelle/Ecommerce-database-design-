CREATE DATABASE Ecommerce;

-- creating tables
USE Ecommerce;

-- 1. Brand Table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 2. Product Category Table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 3. Product Table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 4. Product Image Table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(512) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 5. Color Table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    hex_code VARCHAR(7) -- e.g., #FFFFFF
);

-- 6. Product Item Table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 7. Size Category Table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 8. Size Option Table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- 9. Product Variation Table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- 10. Attribute Category Table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 11. Attribute Type Table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL -- e.g., 'text', 'number', 'boolean'
);

-- 12. Product Attribute Table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(255) NOT NULL,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);


-- Adding sample data into tables

use Ecommerce;

-- 1. Brands
INSERT INTO brand (brand_id, name, description) VALUES
(1, 'Nike', 'Sportswear and athletic gear'),
(2, 'Apple', 'Consumer electronics and software'),
(3, 'Samsung', 'Innovative electronics and appliances'),
(4, 'Adidas', 'Global sports brand'),
(5, 'Sony', 'Entertainment and electronics company');

-- 2. Product Categories
INSERT INTO product_category (category_id, name, description) VALUES
(1, 'Clothing', 'Apparel and fashion wear'),
(2, 'Electronics', 'Devices and gadgets'),
(3, 'Footwear', 'Shoes, sneakers, sandals'),
(4, 'Accessories', 'Wearable tech and gear');

-- 3. Products
INSERT INTO product (product_id, name, brand_id, category_id, base_price, description) VALUES
(1, 'Running Shoes', 1, 3, 89.99, 'Comfortable running shoes for athletes'),
(2, 'iPhone 14', 2, 2, 999.99, 'Latest Apple smartphone'),
(3, 'Galaxy Watch', 3, 4, 299.99, 'Smartwatch with fitness tracking'),
(4, 'Adidas Hoodie', 4, 1, 59.99, 'Warm, stylish hoodie for all seasons'),
(5, 'Sony Headphones', 5, 2, 199.99, 'Noise-cancelling over-ear headphones');

-- 4. Product Images (image url for illustrative purpose only...)
INSERT INTO product_image (image_id, product_id, image_url, alt_text) VALUES
(1, 1, 'https://example.com/images/shoes1.jpg', 'Nike running shoes'),
(2, 2, 'https://example.com/images/iphone14.jpg', 'iPhone 14 front view'),
(3, 3, 'https://example.com/images/galaxy_watch.jpg', 'Samsung Galaxy Watch'),
(4, 4, 'https://example.com/images/adidas_hoodie.jpg', 'Adidas black hoodie'),
(5, 5, 'https://example.com/images/sony_headphones.jpg', 'Sony noise-cancelling headphones');

-- 5. Colors
INSERT INTO color (color_id, name, hex_code) VALUES
(1, 'Red', '#FF0000'),
(2, 'Black', '#000000'),
(3, 'White', '#FFFFFF'),
(4, 'Blue', '#0000FF');

-- 6. Size Categories
INSERT INTO size_category (size_category_id, name) VALUES
(1, 'Clothing Sizes'),
(2, 'Shoe Sizes'),
(3, 'One Size');

-- 7. Size Options
INSERT INTO size_option (size_option_id, size_category_id, label) VALUES
(1, 2, '42'),
(2, 2, '44'),
(3, 1, 'M'),
(4, 1, 'L'),
(5, 3, 'One Size');

-- 8. Product Items
INSERT INTO product_item (item_id, product_id, sku, price, stock_quantity) VALUES
(1, 1, 'NK-SHOE-42-RED', 89.99, 50),
(2, 2, 'APL-IP14-BLK', 999.99, 20),
(3, 3, 'SS-GW-BLUE', 299.99, 30),
(4, 4, 'AD-HOODIE-L-BLK', 59.99, 40),
(5, 5, 'SONY-HEAD-001', 199.99, 25);

-- 9. Product Variations
INSERT INTO product_variation (variation_id, item_id, color_id, size_option_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 5),
(3, 3, 4, 5),
(4, 4, 2, 4),
(5, 5, 3, 5);

-- 10. Attribute Categories
INSERT INTO attribute_category (attribute_category_id, name) VALUES
(1, 'Physical'),
(2, 'Technical');

-- 11. Attribute Types
INSERT INTO attribute_type (attribute_type_id, name) VALUES
(1, 'Text'),
(2, 'Number');

-- 12. Product Attributes
INSERT INTO product_attribute (attribute_id, product_id, attribute_category_id, attribute_type_id, name, value) VALUES
(1, 1, 1, 1, 'Material', 'Mesh'),
(2, 2, 2, 2, 'Storage (GB)', '128'),
(3, 3, 2, 2, 'Battery Life (hours)', '48'),
(4, 4, 1, 1, 'Fabric', 'Cotton Blend'),
(5, 5, 2, 2, 'Driver Size (mm)', '40');