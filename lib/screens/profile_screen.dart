import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEFEFEF), Color(0xFF001636)],
                      stops: [0.06, 0.97],
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -6,
                        top: -18,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2Ffb75425f-d938-4b0f-9d3c-d1991e462ba0.png',
                          width: screenWidth * 1.032,
                          height: screenHeight * 0.334,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.328,
                        top: screenHeight * 0.086,
                        child: Text(
                          'PROFILE',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: screenWidth * 0.093,
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.261,
                        top: screenHeight * 0.156,
                        child: Container(
                          width: screenWidth * 0.475,
                          height: screenHeight * 0.219,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/pic.png'),
                              fit: BoxFit.cover,
                              alignment: Alignment(-0.03, -1),
                              scale: 5.1,
                            ),
                            border: Border.all(
                              width: 4,
                              color: const Color(0xFF001636),
                            ),
                            borderRadius: BorderRadius.circular(screenWidth * 0.237),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.603,
                        top: screenHeight * 0.331,
                        child: Container(
                          width: screenWidth * 0.123,
                          height: screenHeight * 0.057,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(screenWidth * 0.061),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.632,
                        top: screenHeight * 0.345,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2Fee196de6-dfe6-45e0-9b25-311cd8fea838.png',
                          width: screenWidth * 0.064,
                          height: screenHeight * 0.030,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.093,
                        top: screenHeight * 0.490,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2F2fcce2f8-3140-4038-b0c0-7fbab1a42afa.png',
                            width: screenWidth * 0.816,
                            height: screenHeight * 0.070,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.805,
                        top: screenHeight * 0.509,
                        child: SizedBox(
                          width: screenWidth * 0.045,
                          height: screenHeight * 0.034,
                          child: Text(
                            '>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Caudex',
                              color: Colors.white,
                              fontSize: screenWidth * 0.067,
                              fontWeight: FontWeight.bold,
                              height: 0.7,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.264,
                        top: screenHeight * 0.514,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: screenWidth * 0.053,
                            height: 0.8,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.131,
                        top: screenHeight * 0.510,
                        child: Image.asset(
                          'assets/edit profile.png',
                          width: screenWidth * 0.083,
                          height: screenHeight * 0.031,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.093,
                        top: screenHeight * 0.586,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgetpassword');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2Fcb3908f9-7c0a-4011-9cf4-a5fa286c7e0b.png',
                              width: screenWidth * 0.816,
                              height: screenHeight * 0.070,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.805,
                        top: screenHeight * 0.605,
                        child: SizedBox(
                          width: screenWidth * 0.045,
                          height: screenHeight * 0.034,
                          child: Text(
                            '>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Caudex',
                              color: Colors.white,
                              fontSize: screenWidth * 0.067,
                              fontWeight: FontWeight.bold,
                              height: 0.7,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.264,
                        top: screenHeight * 0.610,
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: screenWidth * 0.053,
                            height: 0.8,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.144,
                        top: screenHeight * 0.607,
                        child: Image.asset(
                          'assets/change password.png',
                          width: screenWidth * 0.061,
                          height: screenHeight * 0.028,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.093,
                        top: screenHeight * 0.682,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2Fbfcb613b-2028-422e-8aee-81ee252133ed.png',
                            width: screenWidth * 0.816,
                            height: screenHeight * 0.070,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.805,
                        top: screenHeight * 0.701,
                        child: SizedBox(
                          width: screenWidth * 0.045,
                          height: screenHeight * 0.034,
                          child: Text(
                            '>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Caudex',
                              color: Colors.white,
                              fontSize: screenWidth * 0.067,
                              fontWeight: FontWeight.bold,
                              height: 0.7,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.264,
                        top: screenHeight * 0.706,
                        child: Text(
                          'Language',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: screenWidth * 0.053,
                            height: 0.8,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.144,
                        top: screenHeight * 0.703,
                        child: Image.asset(
                          'assets/language.png',
                          width: screenWidth * 0.061,
                          height: screenHeight * 0.028,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.093,
                        top: screenHeight * 0.775,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0RtgVWh8wVg1fysBxIg4%2F71e795e7-0778-413e-ae81-5735423cf972.png',
                              width: screenWidth * 0.816,
                              height: screenHeight * 0.070,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.805,
                        top: screenHeight * 0.793,
                        child: SizedBox(
                          width: screenWidth * 0.045,
                          height: screenHeight * 0.034,
                          child: Text(
                            '>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Caudex',
                              color: Colors.white,
                              fontSize: screenWidth * 0.067,
                              fontWeight: FontWeight.bold,
                              height: 0.7,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.264,
                        top: screenHeight * 0.798,
                        child: Text(
                          'Log out ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: screenWidth * 0.053,
                            height: 0.8,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.131,
                        top: screenHeight * 0.794,
                        child: Image.asset(
                          'assets/log out.png',
                          width: screenWidth * 0.083,
                          height: screenHeight * 0.031,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.189,
                        top: screenHeight * 0.405,
                        child: SizedBox(
                          width: screenWidth * 0.624,
                          child: Text(
                            'Abdallah Mamdooh',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: screenWidth * 0.059,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.131,
                        top: screenHeight * 0.437,
                        child: SizedBox(
                          width: screenWidth * 0.736,
                          height: screenHeight * 0.027,
                          child: Text(
                            'boody@mamdooh | +20 1146777552',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.037,
                              height: 1.4,
                              fontFamily: 'Roboto',
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
                              _buildNavItemWithImage('Profile', 'assets/Profile icon.png', screenWidth, screenHeight, isActive: true),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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