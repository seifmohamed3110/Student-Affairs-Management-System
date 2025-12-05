import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
                  borderRadius: BorderRadius.zero, // Remove border radius for full screen
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
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Main Image - Moved down slightly
                            Container(
                              margin: EdgeInsets.only(
                                top: screenHeight * 0.15, // Increased from 0.1 to 0.15
                                bottom: screenHeight * 0.05,
                              ),
                              width: screenWidth * 0.7,
                              height: screenHeight * 0.35,
                              child: Image.asset(
                                "assets/sadat logo firstscreen.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            // Main Card - Fixed size 283 x 56
                            Container(
                              width: 283, // Fixed width
                              height: 56, // Fixed height
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFFFFFFF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(32), // Adjusted border radius
                                color: const Color(0xFF001636),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x40000000),
                                    blurRadius: 4,
                                    offset: Offset(0, screenHeight * 0.01),
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView( // Added to handle overflow
                                physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FittedBox( // Scale text to fit
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "STUDENT AFFAIRS",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 26, // Same font size
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    FittedBox( // Scale text to fit
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "FCI SAMS",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 26, // Same font size
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    FittedBox( // Scale text to fit
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                          color: const Color(0xFF001636),
                                          fontSize: 10, // Same font size
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Add 100 pixels distance between card and button
                            SizedBox(height: 100),

                            // Small Icon Button with bold dashed border
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(screenWidth * 0.5),
                                      color: const Color(0xFF001636),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x40000000),
                                          blurRadius: 4,
                                          offset: Offset(0, screenHeight * 0.01),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(screenWidth * 0.05),
                                    child: Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      child: Image.network(
                                        "assets/right-arrow.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  // Dashed border for button with bold stroke
                                  CustomPaint(
                                    size: Size(screenWidth * 0.25, screenWidth * 0.25),
                                    painter: DashedBorderPainter(
                                      dashCount: 15, // Exactly 15 dashes
                                      color: const Color(0xFFFFFFFF),
                                      strokeWidth: 4, // Increased from 2 to 4 for bold effect
                                      isCircle: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Add some bottom spacing
                            SizedBox(height: screenHeight * 0.05),
                          ],
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

// Custom painter for dashed borders
class DashedBorderPainter extends CustomPainter {
  final int dashCount;
  final Color color;
  final double strokeWidth;
  final bool isCircle;

  DashedBorderPainter({
    required this.dashCount,
    required this.color,
    required this.strokeWidth,
    this.isCircle = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    if (isCircle) {
      // Draw circle with exactly dashCount dashes
      final center = Offset(size.width / 2, size.height / 2);
      final radius = size.width / 2 - strokeWidth / 2;
      _drawDashedCircle(canvas, center, radius, paint);
    }
  }

  void _drawDashedCircle(Canvas canvas, Offset center, double radius, Paint paint) {
    const fullCircle = 2 * 3.141592653589793;
    final dashAngle = fullCircle / dashCount;
    final dashLength = dashAngle * 0.7; // 70% dash, 30% gap
    final gapLength = dashAngle * 0.3;

    var startAngle = 0.0;

    for (int i = 0; i < dashCount; i++) {
      final endAngle = startAngle + dashLength;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashLength,
        false,
        paint,
      );
      startAngle = endAngle + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}