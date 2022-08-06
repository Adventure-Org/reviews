const express = require('express');

const router = express.Router();
const db = require('./models/reviews');

router.get('/reviews', db.getReviews);
router.get('/reviews/meta', db.getMetadata);
router.post('/reviews', db.addReview);
router.put('/reviews/:review_id/helpful', db.markHelpful);
router.put('/reviews/:review_id/report', db.reportReview);

module.exports = router;
