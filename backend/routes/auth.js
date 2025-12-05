const express = require('express');
const router = express.Router();

// Mock database users
const users = [
    { studentCode: 'FCI001', password: '123456', name: 'Abdallah Mamdooh', email: 'boody@mamdooh', phone: '+201146777552' }
];

// POST /api/login
router.post('/login', (req, res) => {
    const { studentCode, password } = req.body;

    const user = users.find(u => u.studentCode === studentCode && u.password === password);

    if (user) {
        res.json({ success: true, user });
    } else {
        res.status(401).json({ success: false, message: 'Invalid credentials' });
    }
});

module.exports = router;
