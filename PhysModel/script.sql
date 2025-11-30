-- ===========================================
-- 1. CATEGORY
-- ===========================================
CREATE TABLE Category (
    category_id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name               VARCHAR(100) NOT NULL,
    parent_category_id INT UNSIGNED,
    FOREIGN KEY (parent_category_id)
        REFERENCES Category(category_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- ===========================================
-- 2. SUPPLIER
-- ===========================================
CREATE TABLE Supplier (
    supplier_id   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    contact_phone VARCHAR(20),
    address       VARCHAR(255)
);

-- ===========================================
-- 3. PRODUCT
-- ===========================================
CREATE TABLE Product (
    product_id   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(150) NOT NULL,
    category_id  INT UNSIGNED NOT NULL,
    supplier_id  INT UNSIGNED,
    price        DECIMAL(12,2) NOT NULL CHECK (price >= 0),
    description  VARCHAR(500),

    FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (supplier_id)
        REFERENCES Supplier(supplier_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE INDEX idx_product_category ON Product(category_id);

-- ===========================================
-- 4. CUSTOMER
-- ===========================================
CREATE TABLE Customer (
    customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(150) NOT NULL,
    email       VARCHAR(254) NOT NULL UNIQUE,
    phone       VARCHAR(20),
    address     VARCHAR(255)
);

-- ===========================================
-- 5. ORDERS
-- ===========================================
CREATE TABLE Orders (
    order_id     INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT UNSIGNED NOT NULL,
    order_date   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status       VARCHAR(50) NOT NULL DEFAULT 'pending',

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE INDEX idx_orders_customer ON Orders(customer_id);

-- ===========================================
-- 6. ORDER ITEM
-- ===========================================
CREATE TABLE OrderItem (
    order_id   INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    price      DECIMAL(12,2) NOT NULL CHECK (price >= 0),

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ===========================================
-- 7. INVENTORY
-- ===========================================
CREATE TABLE Inventory (
    product_id        INT UNSIGNED PRIMARY KEY,
    quantity_in_stock INT NOT NULL DEFAULT 0 CHECK (quantity_in_stock >= 0),

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
