import 'package:flutter/material.dart';

class ExamSchedule extends StatelessWidget {
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
                    // Main Content with Scroll
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.12),
                      child: Column(
                        children: [
                          // Header
                          Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.08,
                              left: screenWidth * 0.064,
                              right: screenWidth * 0.064,
                            ),
                            child: Text(
                              'Exam schedule',
                              style: TextStyle(
                                color: const Color(0xFF001636),
                                fontSize: screenWidth * 0.069,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.15,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),

                          // Main Content Container
                          Container(
                            width: screenWidth * 0.872,
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.04,
                              bottom: screenHeight * 0.02,
                              left: screenWidth * 0.064,
                              right: screenWidth * 0.064,
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
                                  // Faculty of Computer Science Section
                                  Text(
                                    'Faculty of Computer Science',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.059,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.36,
                                      letterSpacing: -0.50,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      print('Download Computer Science schedule');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: screenHeight * 0.068,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Download\n from here',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.07,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1,
                                            letterSpacing: -0.50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.04),

                                  // Faculty of Languages and Translation Section
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Faculty of Languages and Translation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.059,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.36,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      print('Download Languages schedule');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: screenHeight * 0.068,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Download\n from here',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.07,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1,
                                            letterSpacing: -0.50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.04),

                                  // Faculty of Management Sciences Section
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Faculty of Management Sciences',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.059,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.36,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      print('Download Management Sciences schedule');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: screenHeight * 0.068,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Download\n from here',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF34C759),
                                            fontSize: screenWidth * 0.07,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1,
                                            letterSpacing: -0.50,
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
                              child: _buildNavItemWithImage(context, 'Home', 'assets/Home icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/request');
                              },
                              child: _buildNavItemWithImage(context, 'Requests', 'assets/Request icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/chat');
                              },
                              child: _buildNavItemWithImage(context, 'Chat', 'assets/Chat icon.png', screenWidth, screenHeight),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: _buildNavItemWithImage(context, 'Profile', 'assets/Profile icon.png', screenWidth, screenHeight),
                            ),
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

  Widget _buildNavItemWithImage(BuildContext context, String title, String imagePath, double screenWidth, double screenHeight, {bool isActive = false}) {
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