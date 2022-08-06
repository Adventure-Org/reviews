\COPY reviews FROM '/Users/andychow/Hackreactor/Atelier-Backend/data/reviews.csv' DELIMITER ',' CSV HEADER;

\COPY reviews_photos FROM '/Users/andychow/Hackreactor/Atelier-Backend/data/reviews_photos.csv' DELIMITER ',' CSV HEADER;

\COPY characteristics FROM '/Users/andychow/Hackreactor/Atelier-Backend/data/characteristics.csv' DELIMITER ',' CSV HEADER;

\COPY characteristics_reviews FROM '/Users/andychow/Hackreactor/Atelier-Backend/data/characteristic_reviews.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE reviews
ALTER COLUMN date TYPE timestamp
USING to_timestamp(date / 1000::numeric);

CREATE INDEX idx_review_id ON reviews(product_id);
CREATE INDEX idx_photos_id ON reviews_photos(review_id);
CREATE INDEX idx_characteristics_id ON characteristics(product_id);
CREATE INDEX idx_characteristics_reviews_id ON characteristics_reviews(characteristic_id);

SELECT setval(pg_get_serial_sequence('reviews', 'review_id'), (SELECT max(review_id) FROM reviews));

-- UPDATE reviews SET date = to_timestamp(date);

-- ALTER TABLE questions
-- ALTER COLUMN date_written TYPE timestamp
-- USING to_timestamp(date_written / 1000::numeric);

--psql postgres postgres

--psql -U postgres < /directory

--psql -U postgres < /Users/andychow/Hackreactor/Atelier-Backend/PostgreSQLReviews.sql

--psql postgres < /Users/andychow/Hackreactor/Atelier-Backend/PostgreSQLCopy.sql