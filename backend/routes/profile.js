const express = require('express');
const router = express.Router();
const { getProfile, updateProfile } = require('../controllers/profileController');

// Get profile by student ID
router.get('/:studentId', getProfile);

// Update profile contact info
router.patch('/:studentId', updateProfile);

module.exports = router;
