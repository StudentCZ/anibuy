CREATE TABLE Users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone_number VARCHAR(25),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR (255),
  country VARCHAR (255),
  zip_code VARCHAR (255),
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

CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY,
  order_number VARCHAR (255),
  total_price DECIMAL(10, 2),
  shipping_address VARCHAR(255),
  payment_method VARCHAR(255),
  status BOOLEAN,
  user_id INTEGER REFERENCES Users(user_id),
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

);
