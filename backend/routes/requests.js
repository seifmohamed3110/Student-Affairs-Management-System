let requests = []; // Temporary in-memory storage for requests

// PATCH /api/request/:id/status
router.patch('/request/:id/status', (req, res) => {
    const requestId = parseInt(req.params.id);
    const { status } = req.body;

    const request = requests.find(r => r.requestId === requestId);
    if (!request) {
        return res.status(404).json({ success: false, message: 'Request not found' });
    }

    if (!status) {
        return res.status(400).json({ success: false, message: 'Status is required' });
    }

    request.status = status; // Update status
    res.json({ success: true, request });
});





// POST /api/request
router.post('/request', (req, res) => {
    const { studentCode, documentType, purpose, notes } = req.body;

    if (!studentCode || !documentType || !purpose) {
        return res.status(400).json({ success: false, message: 'Missing required fields' });
    }

    const requestId = requests.length + 1; // Simple auto-increment ID
    const newRequest = {
        requestId,
        studentCode,
        documentType,
        purpose,
        notes: notes || '',
        status: 'Pending',
        dateSubmitted: new Date(),
    };

    requests.push(newRequest);
    res.json({ success: true, request: newRequest });
});

// GET /api/requests/:studentCode - to fetch all requests of a student
router.get('/requests/:studentCode', (req, res) => {
    const { studentCode } = req.params;
    const studentRequests = requests.filter(r => r.studentCode == studentCode);
    res.json({ success: true, requests: studentRequests });
});
