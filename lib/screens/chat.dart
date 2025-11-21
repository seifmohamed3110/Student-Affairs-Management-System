import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hi, I just finished the Python basics course you recommended!",
      isSent: true,
      isFile: false,
    ),
    ChatMessage(
      text: "That's great to hear! How did you find it?",
      isSent: false,
      isFile: false,
    ),
    ChatMessage(
      text: "It was pretty good. I understood most of it, but I struggled a bit with functions.",
      isSent: true,
      isFile: false,
    ),
    ChatMessage(
      text: "Totally normal—functions can be tricky at first. Would you like some additional resources?",
      isSent: false,
      isFile: false,
    ),
  ];

  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: _messageController.text,
        isSent: true,
        isFile: false,
      ));
      _messageController.clear();
    });

    // Simulate received message after a delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _messages.add(ChatMessage(
          text: "Thanks for your message! I'll get back to you soon.",
          isSent: false,
          isFile: false));
    });
  }

  Future<void> _sendFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _messages.add(ChatMessage(
          text: file.path,
          isSent: true,
          isFile: true,
        ));
      });

      // Simulate received file after a delay
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _messages.add(ChatMessage(
          text: "https://example.com/sample_file.pdf",
          isSent: false,
          isFile: true,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.02),
            end: Alignment(0.50, 1.00),
            colors: [const Color(0xFFEFEFEF), const Color(0xFF001636)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Combined Header with Title and Subtitle
            Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.094,
                left: screenWidth * 0.056,
                right: screenWidth * 0.056,
              ),
              width: screenWidth * 0.891,
              height: screenHeight * 0.140, // Increased height to fit both texts
              decoration: ShapeDecoration(
                color: Colors.transparent, // Transparent background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chat with us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF001636), // Changed to dark blue
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.50,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    'Your academic services made simple',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF001636),
                      fontSize: screenWidth * 0.052,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.94,
                      letterSpacing: -0.50,
                    ),
                  ),
                ],
              ),
            ),

            // Chat Content Area - Flexible to handle keyboard
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: screenHeight * 0.023,
                  left: screenWidth * 0.056,
                  right: screenWidth * 0.056,
                  bottom: screenHeight * 0.02,
                ),
                child: Column(
                  children: [
                    // Today indicator
                    _buildDateDivider(screenWidth),

                    // Messages List in scrollable container
                    Expanded(
                      child: ListView.builder(
                        reverse: false,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return message.isFile
                              ? _buildFileMessage(message.text, message.isSent, context, screenWidth)
                              : message.isSent
                              ? _buildSentMessage(message.text, EdgeInsets.only(
                            top: 8,
                            bottom: index == _messages.length - 1 ? 16 : 8,
                          ), context, screenWidth)
                              : _buildReceivedMessage(message.text, EdgeInsets.only(
                            top: 8,
                            bottom: index == _messages.length - 1 ? 16 : 8,
                          ), context, screenWidth);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Message Input Field
            Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.056,
                right: screenWidth * 0.056,
                bottom: screenHeight * 0.02,
              ),
              width: screenWidth * 0.891,
              height: screenHeight * 0.060,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file, color: const Color(0xFF001636), size: screenWidth * 0.06),
                    onPressed: _sendFile,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: screenWidth * 0.038,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.038,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: const Color(0xFF001636), size: screenWidth * 0.06),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),

            // Bottom pigation Bar - Only show when keyboard is not visible
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Container(
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
                    _buildNavItemWithImage('Chat', 'assets/Chat icon.png', screenWidth, screenHeight, isActive: true),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: _buildNavItemWithImage('Profile', 'assets/Profile icon.png', screenWidth, screenHeight),
                    )                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateDivider(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.black.withOpacity(0.25),
              thickness: 1,
              indent: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.black.withOpacity(0.52),
                fontSize: screenWidth * 0.035,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                letterSpacing: 2.80,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.black.withOpacity(0.25),
              thickness: 1,
              endIndent: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String text, EdgeInsets padding, BuildContext context, double screenWidth) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF001636),
              fontSize: screenWidth * 0.038,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSentMessage(String text, EdgeInsets padding, BuildContext context, double screenWidth) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF001636),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.038,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileMessage(String filePath, bool isSent, BuildContext context, double screenWidth) {
    final isLocalFile = filePath.startsWith('/');
    final fileName = isLocalFile ? filePath.split('/').last : filePath.split('/').last;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening file: $fileName')),
            );
          },
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            decoration: BoxDecoration(
              color: isSent ? const Color(0xFF001636) : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.insert_drive_file,
                  color: isSent ? Colors.white : const Color(0xFF001636),
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.02),
                Flexible(
                  child: Text(
                    fileName,
                    style: TextStyle(
                      color: isSent ? Colors.white : const Color(0xFF001636),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
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

class ChatMessage {
  final String text;
  final bool isSent;
  final bool isFile;

  ChatMessage({
    required this.text,
    required this.isSent,
    required this.isFile,
  });
}