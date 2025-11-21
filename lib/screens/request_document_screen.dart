import 'package:flutter/material.dart';

class RequestDocumentScreen extends StatefulWidget {
  @override
  _RequestDocumentScreenState createState() => _RequestDocumentScreenState();
}

class _RequestDocumentScreenState extends State<RequestDocumentScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // List of available documents
  final List<Map<String, dynamic>> _documents = [
    {
      'name': 'Enrollment Certificate',
      'route': '/enrollment',
      'type': 'Enrollment\nCertificate'
    },
    {
      'name': 'Transcript',
      'routes': '/transcript',
      'type': 'Transcript'
    },
    {
      'name': 'Graduation Certificate',
      'route': '/Gradcertificate',
      'type': 'Graduation\nCertificate'
    },
    {
      'name': 'To Whom It May Concern',
      'route': '/Concern',
      'type': 'To Whom It May\nConcern'
    },
  ];

  List<Map<String, dynamic>> _filteredDocuments = [];

  @override
  void initState() {
    super.initState();
    _filteredDocuments = _documents;
    _searchController.addListener(_filterDocuments);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterDocuments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredDocuments = _documents;
      } else {
        _filteredDocuments = _documents.where((doc) {
          return doc['name'].toLowerCase().contains(query) ||
              doc['type'].toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredDocuments = _documents;
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

                    // Search Bar - Functional
                    Positioned(
                      left: screenWidth * 0.056,
                      top: screenHeight * 0.089,
                      child: Container(
                        width: screenWidth * 0.891,
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                          decoration: ShapeDecoration(
                            color: const Color(0xEDFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: const Color(0x993C3C43),
                                size: screenWidth * 0.06,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  focusNode: _searchFocusNode,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: const Color(0x993C3C43),
                                      fontSize: screenWidth * 0.045,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400,
                                      height: 1.29,
                                      letterSpacing: -0.41,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.045,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    height: 1.29,
                                    letterSpacing: -0.41,
                                  ),
                                  onChanged: (value) {
                                    // Filtering is handled by the listener
                                  },
                                ),
                              ),
                              if (_searchController.text.isNotEmpty)
                                GestureDetector(
                                  onTap: _clearSearch,
                                  child: Icon(
                                    Icons.clear,
                                    color: const Color(0x993C3C43),
                                    size: screenWidth * 0.06,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Document Cards - Dynamic based on search
                    Positioned(
                      left: screenWidth * 0.056,
                      top: screenHeight * 0.165,
                      right: screenWidth * 0.056,
                      child: Container(
                        height: screenHeight * 0.67,
                        child: _filteredDocuments.isEmpty
                            ? Center(
                          child: Text(
                            'No documents found',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                            : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _filteredDocuments.length,
                          itemBuilder: (context, index) {
                            final document = _filteredDocuments[index];
                            return Container(
                              width: screenWidth * 0.872,
                              height: screenHeight * 0.153,
                              margin: EdgeInsets.only(
                                bottom: index < _filteredDocuments.length - 1
                                    ? screenHeight * 0.025
                                    : 0,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF001636),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, document['route']);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      document['type'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.08,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                              child: _buildNavItemWithImage('Requests', 'assets/Request icon.png', screenWidth, screenHeight, isActive: true),
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