// import '@testing-library/jest';
// import reviews from '../server/models/reviews';
const request = require('supertest');
const express = require('express');
const router = require('../server/routes');

const app = express();
app.use('/', router);

const exampleReview = {
  product_id: 40345,
  rating: 5,
  summary: 'Best purchase ever!',
  body: 'Test test test test test test test test test test test test x',
  recommend: true,
  name: 'tester',
  email: 'test@gmail.com',
  photos: ['http://res.cloudinary.com/dxhzukgow/image/upload/v1659200489/lhqiambzthb2tyxgs8jy.jpg'],
  characteristics: {
    135232: 5, 135233: 5, 135234: 5, 135235: 5,
  },
};

const productID = 8080;

test('Test to see if Jest works', () => {
  expect(1 + 2).toBe(3);
});

describe('Testing get review', () => {
  test('It should get reviews', (done) => {
    request(app)
      .get('/reviews?product_id=40345')
      .then((response) => {
        expect(response.statusCode).toBe(200);
        done();
      });
  });
});

// test('Test adding a review', () => {

// });
