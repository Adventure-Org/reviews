const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
// const db = require('./db/index.js');
const router = require('./routes');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// app.use(express.static(__dirname + + '/../client'));
app.use(cors());
app.use(express.json());
app.use('/', router);
app.use((req) => { console.log(req.method, req.url); });

// const {pool} = pg
const port = process.env.PORT || 3001;

app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}`);
});
