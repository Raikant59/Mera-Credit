const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(cors());

app.get('/link', (req, res) => {
  res.json({ url: 'https://meracredit.in' });
});

app.listen(PORT, () => {
  console.log(`API running at http://localhost:${PORT}/link`);
});
