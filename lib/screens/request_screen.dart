import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
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
                                  'Requests',
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

                          // Request Cards
                          Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.023,
                              left: screenWidth * 0.056,
                              right: screenWidth * 0.056,
                              bottom: screenHeight * 0.15,
                            ),
                            child: Column(
                              children: [
                                // Enrollment Certificate Card
                                _buildRequestCard(
                                  context: context,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  title: 'Enrollment Certificate',
                                  status: 'Your Enrollment Certificate request has been submitted successfully',
                                  trackingNumber: 'Tracking Number: #REQ-2031',
                                  isFirst: true,
                                ),
                                SizedBox(height: screenHeight * 0.015),

                                // Transcript Card
                                _buildRequestCard(
                                  context: context,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  title: 'Transcript',
                                  status: 'Your Transcript request has been submitted successfully',
                                  trackingNumber: 'Tracking Number: #REQ-2045',
                                ),
                                SizedBox(height: screenHeight * 0.015),

                                // Graduation Certificate Card
                                _buildRequestCard(
                                  context: context,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  title: 'Graduation Certificate',
                                  status: 'Your Graduation certificate request has been submitted successfully',
                                  trackingNumber: 'Tracking Number: #REQ-2071',
                                ),
                                SizedBox(height: screenHeight * 0.015),

                                // To Whom It May Concern Card
                                _buildRequestCard(
                                  context: context,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  title: 'To Whom It May Concern',
                                  status: 'Your to whom it may concern request has been submitted successfully',
                                  trackingNumber: 'Tracking Number: #REQ-2011',
                                  isLast: true,
                                ),
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
                            GestureDetector(
                            onTap: () {
                      Navigator.pushNamed(context, '/home');
                      },
                        child: _buildNavItemWithImage('Home', 'assets/Home icon.png', screenWidth, screenHeight),
                      ),
                      _buildNavItemWithImage('Requests', 'assets/Request icon.png', screenWidth, screenHeight, isActive: true),
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

  Widget _buildRequestCard({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required String title,
    required String status,
    required String trackingNumber,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.18,
      decoration: ShapeDecoration(
        color: const Color(0xFF001636),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          // Three dots menu
          Positioned(
            right: screenWidth * 0.04,
            top: screenHeight * 0.02,
            child: Container(
              width: screenWidth * 0.05,
              height: screenWidth * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    right: screenWidth * 0.008,
                    top: screenWidth * 0.012,
                    child: Container(
                      width: screenWidth * 0.008,
                      height: screenWidth * 0.008,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenWidth * 0.008,
                    top: screenWidth * 0.024,
                    child: Container(
                      width: screenWidth * 0.008,
                      height: screenWidth * 0.008,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenWidth * 0.008,
                    top: screenWidth * 0.036,
                    child: Container(
                      width: screenWidth * 0.008,
                      height: screenWidth * 0.008,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.055,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    letterSpacing: -0.50,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  status,
                  style: TextStyle(
                    color: const Color(0xFF34C759),
                    fontSize: screenWidth * 0.038,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -0.50,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  trackingNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.038,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -0.50,
                  ),
                ),
              ],
            ),
          ),
        ],
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