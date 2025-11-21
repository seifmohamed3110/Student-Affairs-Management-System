import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                child: Stack(
                  children: [
                    // Main Content with Scroll
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.08,
                              bottom: screenHeight * 0.15,
                              left: screenWidth * 0.06,
                              right: screenWidth * 0.06,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Welcome Section
                                Row(
                                  children: [
                                    Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/pic.png'),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 2,
                                            strokeAlign: BorderSide.strokeAlignOutside,
                                            color: const Color(0xFF001636),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.03),
                                    Expanded(
                                      child: Text(
                                        'Welcome,\nAbdallah Mamdooh',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.048,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          height: 1.25,
                                          letterSpacing: -0.50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenWidth * 0.10,
                                      height: screenWidth * 0.10,
                                      child: Image.asset(
                                        'assets/search icon.png',
                                        width: screenWidth * 0.08,
                                        height: screenWidth * 0.08,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.025),

                                // Level and GPA Cards
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.42,
                                      height: screenHeight * 0.055,
                                      padding: EdgeInsets.all(screenWidth * 0.025),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF001636),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            strokeAlign: BorderSide.strokeAlignOutside,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        'level : 4th',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.055,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          height: 1.50,
                                          letterSpacing: -0.50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenWidth * 0.42,
                                      height: screenHeight * 0.055,
                                      padding: EdgeInsets.all(screenWidth * 0.025),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF001636),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            strokeAlign: BorderSide.strokeAlignOutside,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        'GPA : 3.89',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.055,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          height: 1.50,
                                          letterSpacing: -0.50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.015),

                                // Department Card
                                Container(
                                  width: double.infinity,
                                  height: screenHeight * 0.055,
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF001636),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2,
                                        strokeAlign: BorderSide.strokeAlignOutside,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    'Department : Software Engineer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.048,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 1.67,
                                      letterSpacing: -0.50,
                                    ),
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.03),

                                // Categories Section
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Categories',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.048,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.015),

                                // Request Document Card - Centered with spacing
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/RequestaDocument');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.10,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF001636),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 41,
                                            height: 41,
                                            child: _buildImageWithFallback("assets/document.png"),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Request a Document',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.055,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.30,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.015),

                                // Exam Schedule Card - Centered with spacing
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/exam schedule');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.10,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF001636),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 41,
                                            height: 41,
                                            child: _buildImageWithFallback("assets/studying-exam.png"),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Exam schedule',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.062,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.15,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.03),

                                // Track Requests Section
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Track Requests',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.048,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                      ),
                                    ),
                                    Text(
                                      'See all',
                                      style: TextStyle(
                                        color: const Color(0xFF7D8994),
                                        fontSize: screenWidth * 0.042,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 1.60,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.015),

                                // Request Tracking Card - Make it clickable
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EnrollmentCertificateDetailScreen()),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.17,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF001636),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(screenWidth * 0.035),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Enrollment Certificate',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.058,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.20,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.008),
                                          Text(
                                            'Your Enrollment Certificate request has been submitted successfully',
                                            style: TextStyle(
                                              color: const Color(0xFF34C759),
                                              fontSize: screenWidth * 0.048,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w500,
                                              height: 1,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.008),
                                          Text(
                                            'Tracking Number: #REQ-2031',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.048,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w500,
                                              height: 1,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.02),
                              ],
                            ),
                          ),
                        ],
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
                            _buildNavItemWithImage('Home', 'assets/Home icon.png', screenWidth, screenHeight, isActive: true),
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
          width: 41,
          height: 41,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.image_not_supported,
            color: Colors.grey[600],
            size: 20,
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

class EnrollmentCertificateDetailScreen extends StatelessWidget {
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
                    // Main Content with Scroll - Fixed with proper bottom padding
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.12), // Add padding for bottom navigation
                      child: Column(
                        children: [
                          // Header with additional text - Left aligned
                          Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.094,
                              left: screenWidth * 0.056,
                              right: screenWidth * 0.056,
                            ),
                            width: screenWidth * 0.891,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF001636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enrollment Certificate',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.074,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.50,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.008),
                                  Text(
                                    'Your Enrollment Certificate request has been submitted successfully',
                                    style: TextStyle(
                                      color: const Color(0xFF34C759),
                                      fontSize: screenWidth * 0.048,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                      letterSpacing: -0.50,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.008),
                                  Text(
                                    'Tracking Number: #REQ-2031',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.048,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                      letterSpacing: -0.50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Main Content Container - Fixed height constraints
                          Container(
                            width: screenWidth * 0.891,
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.023,
                              bottom: screenHeight * 0.02, // Reduced bottom margin
                              left: screenWidth * 0.056,
                              right: screenWidth * 0.056,
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF001636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Upload Section
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Please upload a clear photo of your National ID. *',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(1),
                                            fontSize: screenWidth * 0.036,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'UPLOADED',
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.038,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),

                                  // Purpose Section
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'What is the purpose of this certificate? *',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(1),
                                            fontSize: screenWidth * 0.036,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'For internship/training',
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.038,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),

                                  // Receive Method Section
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'How would you like to receive your certificate? *',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(1),
                                            fontSize: screenWidth * 0.036,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'PDF',
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.038,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),

                                  // Notes Section
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Do you want to add any notes for the Student Affairs team? *',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(1),
                                            fontSize: screenWidth * 0.036,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Please stamp it',
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.038,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
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

                    // Back Button REMOVED

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

  Widget _buildNavItemWithImage(String title, String imagePath, double screenWidth, double screenHeight, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.065,
          height: screenWidth * 0.065,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: screenWidth * 0.065,
                height: screenWidth * 0.065,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.grey[600],
                  size: screenWidth * 0.04,
                ),
              );
            },
          ),
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
