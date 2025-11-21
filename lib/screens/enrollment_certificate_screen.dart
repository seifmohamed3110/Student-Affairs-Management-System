import 'dart:ui';

import 'package:flutter/material.dart';

class EnrollmentCertificateScreen extends StatefulWidget {
  @override
  _EnrollmentCertificateScreenState createState() => _EnrollmentCertificateScreenState();
}

class _EnrollmentCertificateScreenState extends State<EnrollmentCertificateScreen> {
  final TextEditingController _purposeController = TextEditingController();
  final TextEditingController _receiveController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _showConfirmation = false;

  @override
  void dispose() {
    _purposeController.dispose();
    _receiveController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    print('Submit tapped');
    print('Purpose: ${_purposeController.text}');
    print('Receive: ${_receiveController.text}');
    print('Notes: ${_notesController.text}');

    setState(() {
      _showConfirmation = true;
    });
  }

  void _handleExit() {
    setState(() {
      _showConfirmation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Convert 3cm to logical pixels (assuming ~37.8 pixels per cm)
    final double threeCmInPixels = 2 * 37.8;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.50, 0.02),
                    end: Alignment(0.50, 1.00),
                    colors: [const Color(0xFFEFEFEF), const Color(0xFF001636)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Stack(
                  children: [
                    // Main Content (always visible)
                    Column(
                      children: [
                        // Header Card
                        Container(
                          margin: EdgeInsets.only(
                            top: screenHeight * 0.094,
                            left: screenWidth * 0.056,
                            right: screenWidth * 0.056,
                          ),
                          width: screenWidth * 0.891,
                          height: screenHeight * 0.090,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF001636),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                              child: Text(
                                'Enrollment Certificate',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.08,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.50,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Main Form Container with reduced bottom margin
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.023,
                              left: screenWidth * 0.056,
                              right: screenWidth * 0.056,
                              bottom: threeCmInPixels + screenHeight * 0.06, // Reduced bottom margin to accommodate button
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF001636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // National ID Upload Section
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.150,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(screenWidth * 0.03),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Please upload a clear photo of your National ID.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.035,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.3,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.008),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Handle upload
                                                    print('Upload tapped');
                                                  },
                                                  child: Container(
                                                    width: screenWidth * 0.3,
                                                    height: screenHeight * 0.045,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(0xFF001636),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'UPLOAD HERE',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: screenWidth * 0.030,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: screenWidth * 0.4,
                                                  child: Text(
                                                    'JPG, PNG, or PDF\n(Max 5 MB)',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: const Color(0xFF001636),
                                                      fontSize: screenWidth * 0.035,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: screenHeight * 0.03),

                                  // Purpose of Certificate
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.045,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'What is the purpose of this certificate?',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(1),
                                                fontSize: screenWidth * 0.036,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '*',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.035,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.062,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _purposeController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                        hintText: 'answer',
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: screenWidth * 0.038,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.038,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: screenHeight * 0.03),

                                  // How to Receive Certificate
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.062,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'How would you like to receive your certificate? *',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(1),
                                                fontSize: screenWidth * 0.038,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.035,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.062,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _receiveController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                        hintText: 'answer',
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: screenWidth * 0.038,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.038,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: screenHeight * 0.03),

                                  // Notes for Student Affairs
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.062,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Do you want to add any notes for the Student Affairs team? *',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(1),
                                                fontSize: screenWidth * 0.038,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.035,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.062,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _notesController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                                        hintText: 'answer',
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: screenWidth * 0.038,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.038,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
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

                    // Submit Button positioned 3cm below the form
                    Positioned(
                      left: screenWidth * 0.056,
                      bottom: threeCmInPixels, // 3cm gap from bottom
                      child: GestureDetector(
                        onTap: _handleSubmit,
                        child: Container(
                          width: screenWidth * 0.891,
                          height: screenHeight * 0.060,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF001636),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Blur Background and Confirmation Dialog
                    if (_showConfirmation)
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Stack(
                              children: [
                                // Confirmation Rectangle79
                                Container(
                                  width: 324,
                                  height: 418,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF001636),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 4, color: Colors.white),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Exit Button - Top Right inside the container
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: GestureDetector(
                                            onTap: _handleExit,
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: const Color(0xFF001636),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Content
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Your request for a "Enrollment Certificate" has been successfully submitted.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.4,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                width: 134,
                                                height: 134,
                                                child: _buildImageWithFallback("assets/Accept.png"),
                                              ),
                                            ],
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

                    // Bottom Navigation Bar
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.10,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.015),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: _buildNavItemWithImage('Home', 'assets/Home icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/request');
                              },
                              child: _buildNavItemWithImage('Requests', 'assets/Request icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/chat');
                              },
                              child: _buildNavItemWithImage('Chat', 'assets/Chat icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: _buildNavItemWithImage('Profile', 'assets/Profile icon.png', screenWidth, screenHeight),
                            )
                          ],
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
    );
  }

  Widget _buildImageWithFallback(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 134,
          height: 134,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.image_not_supported,
            color: Colors.grey[600],
            size: 50,
          ),
        );
      },
    );
  }

  Widget _buildNavItemWithImage(String title, String imagePath, double screenWidth, double screenHeight, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.065,
          height: screenWidth * 0.065,
          child: _buildImageWithFallback(imagePath),
        ),
        SizedBox(height: screenHeight * 0.005),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? const Color(0xFF001636) : const Color(0xFF001636).withOpacity(0.6),
            fontSize: screenWidth * 0.032,
            fontFamily: 'Poppins',
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            height: 1.40,
          ),
        ),
      ],
    );
  }
}