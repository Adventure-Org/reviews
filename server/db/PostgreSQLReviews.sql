DROP DATABASE IF EXISTS reviewsdb;
CREATE DATABASE reviewsdb;

\c reviewsdb

DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  rating INT NOT NULL,
  date BIGINT NOT NULL,
  summary VARCHAR(1000),
  body VARCHAR(1000),
  recommend boolean,
  reported boolean,
  reviewer_name VARCHAR(50),
  reviewer_email VARCHAR(50),
  response VARCHAR(1000),
  helpfulness INT NOT NULL
  -- FOREIGN KEY (product_id) REFERENCES characteristics()
);

DROP TABLE IF EXISTS reviews_photos CASCADE;
CREATE TABLE reviews_photos (
  photos_id INT PRIMARY KEY NOT NULL,
  review_id INT NOT NULL,
  url VARCHAR(150),
  FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);

DROP TABLE IF EXISTS characteristics CASCADE;
CREATE TABLE characteristics (
  characteristics_id INT PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  name VARCHAR(10)
  -- FOREIGN KEY (product_id) REFERENCES reviews(product_id)
);

DROP TABLE IF EXISTS characteristics_reviews CASCADE;
CREATE TABLE characteristics_reviews (
  characteristics_reviews_id INT PRIMARY KEY NOT NULL,
  characteristic_id INT NOT NULL,
  review_id INT NOT NULL,
  value INT NOT NULL,
  FOREIGN KEY (review_id) REFERENCES reviews(review_id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics(characteristics_id)
);

-- SELECT date FROM reviews;

-- USE reviewsDB;

-- CREATE TABLE product(
--   product_id INT PRIMARY KEY NOT NULL,
--   -- rating_1 INT,
--   -- rating_2 INT,
--   -- rating_3 INT,
--   -- rating_4 INT,
--   -- rating_5 INT,
--   -- true_count INT,
--   -- false_count INT,
--   -- size_id INT,
--   -- size_value  INT,
--   -- width_id INT,
--   -- width_value INT,
--   -- comfort_id INT,
--   -- comfort_value INT,
--   -- quality_id INT,
--   -- quality_value INT,
--   -- PRIMARY KEY (product_id)
-- );

  -- CONSTRAINT fk_product FOREIGN KEY (review_id) REFERENCES product(product_id)

-- CREATE TABLE photos(
--   photo_id INT PRIMARY KEY NOT NULL,
--   url VARCHAR(255),
--   CONSTRAINT fk_reviews FOREIGN KEY (photo_id) REFERENCES reviews(review_id)
-- );