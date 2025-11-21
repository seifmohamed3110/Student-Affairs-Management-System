// Using the same dummy students array
const students = [
  { studentId: '20210001', password: '1234', name: 'Abdallah Mamdooh', email: 'boody@mamdooh', phone: '+20 1146777552' }
];

// Get profile
exports.getProfile = (req, res) => {
  const student = students.find(s => s.studentId === req.params.studentId);
  if (!student) return res.status(404).json({ success: false, message: 'Student not found' });

  res.json({ success: true, student });
};

// Update profile contact info
exports.updateProfile = (req, res) => {
  const student = students.find(s => s.studentId === req.params.studentId);
  if (!student) return res.status(404).json({ success: false, message: 'Student not found' });

  const { email, phone } = req.body;
  if (email) student.email = email;
  if (phone) student.phone = phone;

  res.json({ success: true, student });
};
