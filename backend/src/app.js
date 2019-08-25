const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const morgan = require('morgan');

const app = express();

app.use(morgan('combined'));
app.use(bodyParser.json());
app.use(cors());

var request = require('request');

var url =
  'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.677604,%20-100.309500&radius=20000&keyword=proteccion%civil&key=AIzaSyDIfjfmb_wrxG5ZH4ym4h9Ea0Q8XCKnOhQ';

app.get('/acopios', (req, res) => {
    request(
        {
            url: url,
            json: true,
        },
        function (error, response, body) {
            if (!error && response.statusCode === 200) {
                res.send(
                    body.results
                )
            }
        },
    );
});

app.listen(8080, err => {
  if (err) {
    console.log(`Error: ${err}`);
  } else {
    console.log(`🚀 BACKEND RUNNING AT PORT 8080`);
  }
});
