import 'package:flutter/material.dart';
import '../api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String studentCode = '';
  String password = '';
  bool rememberMe = false;
  bool _obscurePassword = true;
  bool _isLoading = false;

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
      rememberMe = false; // Load saved remember me preference
    });
  }

  void _saveCredentials() {
    if (rememberMe) {
      // TODO: Save credentials to shared preferences or secure storage
      print('Saving credentials: Student Code: $studentCode, Remember Me: $rememberMe');
    } else {
      // TODO: Clear saved credentials
      print('Clearing saved credentials');
    }
  }

  Future<void> _handleLogin() async {
    // Validate inputs
    if (studentCode.isEmpty || password.isEmpty) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Validation Error'),
          content: const Text('Please fill in all fields'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Save credentials if "Remember Me" is checked
    _saveCredentials();

    try {
      // Call actual API service
      final result = await ApiService.login(studentCode, password);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      if (result['success'] == true) {
        // Navigate to homepage
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        // Show error
        if (mounted) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Login Failed'),
              content: Text((result['message'] as String?) ?? 'Unknown error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Network Error'),
          content: Text('Unable to connect to server: $error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  void _handleForgotPassword() {
    Navigator.pushNamed(context, '/forgetpassword');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.zero,
                  gradient: const LinearGradient(
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
                                    color: const Color(0xFF001636),
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
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: screenWidth * 0.035,
                                  right: screenWidth * 0.49,
                                ),
                                child: Text(
                                  "STUDENT CODE",
                                  style: TextStyle(
                                    color: const Color(0xFF001636),
                                    fontSize: screenWidth * 0.040,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF001636),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 7),
                                  width: double.infinity,
                                  child: TextField(
                                    style: TextStyle(
                                      color: const Color(0xFFEFEFEF),
                                      fontSize: screenWidth * 0.045,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        studentCode = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "eg. FCI 00000 ",
                                      hintStyle: TextStyle(
                                        color: const Color(0xFFEFEFEF).withOpacity(0.7),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: screenWidth * 0.035,
                                  right: screenWidth * 0.55,
                                ),
                                child: Text(
                                  "PASSWORD",
                                  style: TextStyle(
                                    color: const Color(0xFF001636),
                                    fontSize: screenWidth * 0.040,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF001636),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            color: const Color(0xFFEFEFEF),
                                            fontSize: screenWidth * 0.045,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            hintText: "Enter your password",
                                            hintStyle: TextStyle(
                                              color: const Color(0xFFEFEFEF).withOpacity(0.7),
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
                                              color: const Color(0xFFEFEFEF),
                                              size: screenWidth * 0.05,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: IntrinsicHeight(
                                          child: Container(
                                            margin: EdgeInsets.only(right: screenWidth * 0.18),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      rememberMe = !rememberMe;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color: rememberMe
                                                          ? const Color(0xFF001636)
                                                          : const Color(0xFFFFFFFF),
                                                      border: Border.all(
                                                        color: const Color(0xFF001636),
                                                        width: 2,
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color(0x40000000),
                                                          blurRadius: 4,
                                                          offset: Offset(0, 4),
                                                        ),
                                                      ],
                                                    ),
                                                    margin: const EdgeInsets.only(right: 5),
                                                    width: screenWidth * 0.04,
                                                    height: screenWidth * 0.04,
                                                    child: rememberMe
                                                        ? Icon(
                                                      Icons.check,
                                                      color: const Color(0xFFFFFFFF),
                                                      size: screenWidth * 0.03,
                                                    )
                                                        : null,
                                                  ),
                                                ),
                                                Text(
                                                  "REMEMBER ME ",
                                                  style: TextStyle(
                                                    color: const Color(0xFFFFFFFF),
                                                    fontSize: screenWidth * 0.035,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: _handleForgotPassword,
                                          child: Container(
                                            width: double.infinity,
                                            child: Text(
                                              "FORGET PASSWORD ?",
                                              style: TextStyle(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize: screenWidth * 0.032,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: _isLoading ? null : _handleLogin,
                                child: IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: _isLoading
                                          ? const Color(0xFF666666)
                                          : const Color(0xFF001636),
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
                                                  if (_isLoading)
                                                    SizedBox(
                                                      width: screenWidth * 0.06,
                                                      height: screenWidth * 0.06,
                                                      child: const CircularProgressIndicator(
                                                        color: Color(0xFFFFFFFF),
                                                      ),
                                                    )
                                                  else
                                                    Text(
                                                      "LOGIN",
                                                      style: TextStyle(
                                                        color: const Color(0xFFEFEFEF),
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
