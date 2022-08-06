const reviewsSchema = new Schema({
  product_id: Number,
  rating: Number,
  date: DATETIME,
  summarybody: String,
  recommend: Boolean,
  reported: Boolean,
  reviewer_name: String,
  reviewer_email: String,
  response: String,
  helpfulness: Number
});

const reviews_photosSchema = new Schema({
  review_id: Number,
  url: String
});

const characteristicsSchema = new Schema({
  product_id: Number,
  name: String
});

const characteristic_reviewsSchema = new Schema({
  characteristic_id: Number,
  review_id: Number,
  value: Number
});

const reviews = mongoose.model('reviews', reviewsSchema);
const reviews_photos = mongoose.model('reviews_photos', reviews_photosSchema);
const characteristics = mongoose.model('characteristic', characteristicsSchema);
const characteristic_reviews = mongoose.model('characteristic_reviews', characteristic_reviewsSchema);


-- const reviewSchema = new Schema({
--   product_id: Number,
--   results: [{
--     review_id: Number,
--     rating: Number,
--     summary: String,
--     recommend: Boolean,
--     response: String,
--     body: String,
--     date: String,
--     reviewer_name: String,
--     helpfulness: Number,
--     photos: [{
--       id: Number,
--       url: String
--     }]
--   }],
-- });

-- const product = mongoose.model('product', reviewSchema);
