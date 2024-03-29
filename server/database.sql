  CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(25),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Addresses (
    address_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    default_address VARCHAR(255),
    address_type VARCHAR(255),
    recipient_name VARCHAR(255),
    street_address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip_code VARCHAR(255),
    country VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_number VARCHAR (255),
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    payment_method VARCHAR(255),
    status BOOLEAN,
    user_id INTEGER REFERENCES Users(user_id),
    address_id INTEGER REFERENCES Addresses(address_id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR (255),
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Items (
    item_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Products(product_id),
    category_id INT REFERENCES Categories(category_id),
    name VARCHAR (255),
    description VARCHAR (255),
    image_url TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    item_id INT REFERENCES Items(item_id),
    title VARCHAR(255),
    rating DECIMAL(2,1) NOT NULL,
    message TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Wishlists (
    wishlist_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    item_id INT REFERENCES Items(item_id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Coupons (
    coupon_id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Items(item_id),
    code VARCHAR(255) NOT NULL,
    discount_amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE Carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE CartItems (
    cart_id INT REFERENCES Carts(cart_id),
    item_id INT REFERENCES Items(item_id),
    quantity INT NOT NULL,
    PRIMARY KEY (cart_id, item_id)
  );

  CREATE TABLE WishlistItems (
    wishlist_id INT REFERENCES Wishlists(wishlist_id),
    item_id INT REFERENCES Items(item_id),
    PRIMARY KEY (wishlist_id, item_id)
  );
