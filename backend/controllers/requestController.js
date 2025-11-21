let requests = []; // In-memory for now

// Create a new request
exports.createRequest = (req, res) => {
  const { studentId, documentType, purpose } = req.body;
  const newRequest = {
    id: requests.length + 1,
    studentId,
    documentType,
    purpose,
    status: 'Pending',
    dateSubmitted: new Date()
  };
  requests.push(newRequest);
  res.json({ success: true, request: newRequest });
};

// Get all requests for a student
exports.getRequests = (req, res) => {
  const studentRequests = requests.filter(r => r.studentId === req.params.studentId);
  res.json({ success: true, requests: studentRequests });
};

// Update request status
exports.updateRequestStatus = (req, res) => {
  const { status } = req.body;
  const request = requests.find(r => r.id === parseInt(req.params.id));
  if (!request) return res.status(404).json({ success: false, message: 'Request not found' });

  request.status = status;
  res.json({ success: true, request });
};
