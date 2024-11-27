const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Hello, World!', timestamp: new Date().toISOString() });
});

app.get('/download', (req, res) => {
    const data = { message: 'Hello, World!', timestamp: new Date().toISOString() };
    res.setHeader('Content-Disposition', 'attachment; filename="result.json"');
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify(data, null, 2));
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
