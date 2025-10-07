// Simple Express server for CoinBuck demo
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Basic root endpoint
app.get('/', (req, res) => {
res.send('Hello CoinBuck from Azure AKS!');
});

// Health check endpoint used by readinessProbe
app.get('/health', (req, res) => {
res.status(200).send('OK');
});

// Liveness check endpoint used by livenessProbe
app.get('/live', (req, res) => {
res.status(200).send('I am alive!');
});

// Start the server
app.listen(PORT, () => console.log(`Running on port ${PORT}`));