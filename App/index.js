const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;


app.get('/', (req, res) => {
res.send('Hello CoinBuck from Azure AKS!');
});


app.get('/health', (req, res) => {
res.status(200).send('OK');
});


app.get('/live', (req, res) => {
res.status(200).send('I am alive!');
});


app.listen(PORT, () => console.log(`Running on port ${PORT}`));