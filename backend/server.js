const express = require('express');
require('dotenv').config();

const app = express();
const port = 3000;
const mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    console.log('✅ MongoDB connected');
  })
  .catch((err) => {
    console.error('❌ MongoDB connection error:', err.message);
  });




// Middleware to parse JSON
app.use(express.json());

// Import routes
const authRoutes = require('./routes/auth');

// Use routes
app.use('/api', authRoutes);


app.get('/', (req, res) => {
    res.send('Backend is working!');
});

app.listen(3000, '0.0.0.0', () => {
  console.log('Server running on port 3000');
});




