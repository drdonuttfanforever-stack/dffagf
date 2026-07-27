const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/index.hta', (req, res) => {
  res.set('Content-Type', 'application/hta');
  res.sendFile(__dirname + '/check.hta');
});

app.get('/', (req, res) => {
  res.redirect('/check.hta');
});

app.listen(port, '0.0.0.0', () => {
  console.log('HTA server on port ' + port);
});
