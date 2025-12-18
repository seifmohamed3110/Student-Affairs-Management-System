const students = [
  {
    studentId: '20210001',
    password: '1234',
    name: 'Abdallah Mamdooh',
    email: 'boody@mamdooh',
    phone: '+20 1146777552',
    department: 'Computer Science',
    level: '4',
    gpa: 3.2
  }
];

exports.login = (req, res) => {
  const { studentId, password } = req.body;

  if (!studentId || !password) {
    return res.status(400).json({
      success: false,
      message: 'Student ID and password are required'
    });
  }

  const student = students.find(
    s => s.studentId === studentId && s.password === password
  );

  if (!student) {
    return res.status(401).json({
      success: false,
      message: 'Invalid credentials'
    });
  }

  // NEVER send password back
  const { password: _, ...safeStudent } = student;

  res.json({
    success: true,
    student: safeStudent
  });
};
