import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String studentCode = '';
  String password = '';
  String confirmPassword = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    // Load saved credentials if "Remember Me" was previously checked
    _loadSavedCredentials();
  }

  void _loadSavedCredentials() {
    // TODO: Load saved credentials from shared preferences or secure storage
    // For now, we'll just set some dummy values to demonstrate
    setState(() {
      studentCode = ''; // Load saved student code
      password = ''; // Load saved password
      confirmPassword = ''; // Load saved confirm password
    });
  }

  void _saveCredentials() {
    // TODO: Save credentials to shared preferences or secure storage
    print('Saving credentials: Student Code: $studentCode');
  }

  void _handleConfirm() {
    // Save credentials
    _saveCredentials();

    // TODO: Implement password change logic
    print('Confirm pressed - Student Code: $studentCode, New Password: $password');

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your password has been changed successfully!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back to login page after a short delay
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.zero,
                  gradient: LinearGradient(
                    begin: Alignment(-1, -1),
                    end: Alignment(-1, 1),
                    colors: [
                      Color(0xFFEFEFEF),
                      Color(0xFF001636),
                    ],
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: screenHeight * 0.15,
                            bottom: screenHeight * 0.1,
                            left: screenWidth * 0.06,
                            right: screenWidth * 0.06,
                          ),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 13),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: screenWidth * 0.6,
                                        height: screenHeight * 0.25,
                                        child: Image.asset(
                                          "assets/sadat logo login.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: screenHeight * 0.005,
                                  left: screenWidth * 0.03,
                                  right: screenWidth * 0.03,
                                ),
                                width: double.infinity,
                                child: Text(
                                  "STUDENT AFFAIRS FCI SAMS",
                                  style: TextStyle(
                                    color: Color(0xFF001636),
                                    fontSize: screenWidth * 0.04,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: screenHeight * 0.025,
                                  left: screenWidth * 0.0035,
                                  right: screenWidth * 0.0001,
                                ),
                                width: double.infinity,
                                child: Text(
                                  "Your academic services made simple",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Forget password text - centered and full width
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: screenHeight * 0.02,
                                ),
                                width: double.infinity,
                                child: Text(
                                  "FORGET PASSWORD?",
                                  style: TextStyle(
                                    color: Color(0xFF001636),
                                    fontSize: screenWidth * 0.060,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF001636),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 20), // Same spacing as between password fields
                                  width: double.infinity,
                                  child: TextField(
                                    style: TextStyle(
                                      color: Color(0xFFEFEFEF),
                                      fontSize: screenWidth * 0.045,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        studentCode = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "STUDENT CODE",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFEFEFEF),
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              // Password field without label text
                              IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF001636),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 20), // Same spacing as between student code and password
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Color(0xFFEFEFEF),
                                            fontSize: screenWidth * 0.045,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            hintText: "PASSWORD",
                                            hintStyle: TextStyle(
                                                color: Color(0xFFEFEFEF),
                                                fontSize: screenWidth * 0.06,
                                                fontWeight: FontWeight.bold
                                            ),
                                            isDense: true,
                                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          margin: EdgeInsets.only(left: screenWidth * 0.02),
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Icon(
                                              _obscurePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Color(0xFFEFEFEF),
                                              size: screenWidth * 0.05,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Confirm Password field
                              IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF001636),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 20), // Same spacing as between password fields
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Color(0xFFEFEFEF),
                                            fontSize: screenWidth * 0.045,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              confirmPassword = value;
                                            });
                                          },
                                          obscureText: _obscureConfirmPassword,
                                          decoration: InputDecoration(
                                            hintText: "CONFIRM PASSWORD",
                                            hintStyle: TextStyle(
                                              color: Color(0xFFEFEFEF),
                                              fontSize: screenWidth * 0.06,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            isDense: true,
                                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _obscureConfirmPassword = !_obscureConfirmPassword;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          margin: EdgeInsets.only(left: screenWidth * 0.02),
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Icon(
                                              _obscureConfirmPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Color(0xFFEFEFEF),
                                              size: screenWidth * 0.05,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Confirm button
                              InkWell(
                                onTap: _handleConfirm,
                                child: IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xFFEFEFEF),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        IntrinsicWidth(
                                          child: IntrinsicHeight(
                                            child: Container(
                                              padding: const EdgeInsets.only(left: 1, right: 1),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "CONFIRM",
                                                    style: TextStyle(
                                                      color: Color(0xFF001636),
                                                      fontSize: screenWidth * 0.06,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}