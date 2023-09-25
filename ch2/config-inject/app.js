const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    const VAR1 = process.env.VAR1 || 'VARIABLE MISSING';
    const VAR2 = process.env.VAR2 || 'VARIABLE MISSING';
    const SEC3 = process.env.SEC3 || 'VARIABLE MISSING';

    res.send(`
        VAR1: ${VAR1} 
        VAR2: ${VAR2} 
        SEC3: ${SEC3}
    `);
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
