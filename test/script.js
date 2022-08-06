import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  insecureSkipTLSVerify: true,
  noConnectionReuse: false,
  vus: 200,
  duration: '10s',
};

export default () => {
  const data = {
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

  http.get('http://localhost:3001/reviews?product_id=40345');
  http.get('http://localhost:3001/reviews/meta?product_id=40345');
  http.post('http://localhost:3001/reviews?product_id=40345', data);
  http.put('http://localhost:3001/reviews/232062/helpful');
  http.put('http://localhost:3001/reviews/232063/report');
};
