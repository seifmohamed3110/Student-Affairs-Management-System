import 'package:daliaa/screens/Homepage_screen.dart';
import 'package:daliaa/screens/chat.dart';
import 'package:daliaa/screens/enrollment_certificate_screen.dart';
import 'package:daliaa/screens/exam_schedule.dart';
import 'package:daliaa/screens/forgetpassword_screen.dart';
import 'package:daliaa/screens/graduation_certificate_screen.dart';
import 'package:daliaa/screens/profile_screen.dart';
import 'package:daliaa/screens/request_document_screen.dart';
import 'package:daliaa/screens/request_screen.dart';
import 'package:daliaa/screens/to_whom_it_may_concern.dart';
import 'package:daliaa/screens/transcript.dart';
import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
import 'screens/login_screen.dart'; // Import the LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Affairs App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(), // Set FirstScreen as the initial home
      routes: {
        '/first': (context) => const FirstScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgetpassword': (context) => const ForgetPasswordScreen(),
        '/home': (context) => HomeScreen(),
        '/RequestaDocument': (context) => RequestDocumentScreen(),
        '/enrollment': (context) => EnrollmentCertificateScreen(),
        '/transcript': (context) => TranscriptScreen(),
        '/Gradcertificate' : (context) => GraduationCertificateScreen(),
        '/Concern': (context) => ToWhomItMayConcernScreen(),
        '/chat' : (context) => ChatScreen(),
        '/request': (context) => RequestScreen(),
        '/exam schedule': (context) => ExamSchedule(),
        '/profile': (context) => ProfileScreen(),

      },
    );
  }
}


