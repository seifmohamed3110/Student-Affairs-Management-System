import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ⚠️ Make sure this IP is correct for your network.
  // Using port 3000 to match your backend/server.js
  static const String baseUrl = 'http://10.1.1.202:3000/api';

  static Future<Map<String, dynamic>> login(
      String studentId, String password) async {
    // Endpoint changed from /auth/login back to /login to match your backend routes
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        // The key is 'studentCode' in your backend, not 'studentId'
        'studentCode': studentId,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  // Get profile function - Kept for now, might need adjustment
  static Future<Map<String, dynamic>> getProfile(String studentCode) async {
    try {
      final url = Uri.parse('$baseUrl/profile/$studentCode');
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'success': false, 'message': 'Profile not found'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error'};
    }
  }
}
