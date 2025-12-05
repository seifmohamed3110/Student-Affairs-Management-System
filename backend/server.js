const express = require('express');
const app = express();
const port = 3000;


// Middleware to parse JSON
app.use(express.json());

// Import routes
const authRoutes = require('./routes/auth');

// Use routes
app.use('/api', authRoutes);


app.get('/', (req, res) => {
    res.send('Backend is working!');
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});





