// Dummy data for now
const students = [
  { studentId: '20210001', password: '1234', name: 'Abdallah Mamdooh', email: 'boody@mamdooh', phone: '+20 1146777552' }
];

exports.login = (req, res) => {
  const { studentId, password } = req.body;
  const student = students.find(s => s.studentId === studentId && s.password === password);

  if (!student) return res.status(401).json({ success: false, message: 'Invalid ID or password' });

  res.json({ success: true, student });
};
