import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // For Android Emulator, use 10.0.2.2.
  // If testing on a physical device, replace with your PC's local IP (e.g., 192.168.1.5).
  static const String baseUrl = 'http://10.0.2.2:3000/api';

  // Login function
  static Future<Map<String, dynamic>> login(String studentCode, String password) async {
    try {
      final url = Uri.parse('$baseUrl/login');
      
      // Added timeout to prevent indefinite hanging
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'studentCode': studentCode, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // success
      } else {
        try {
          return jsonDecode(response.body);
        } catch (_) {
          return {'success': false, 'message': 'Server error: ${response.statusCode}'};
        }
      }
    } catch (e) {
      // Simplify error message for user
      if (e.toString().contains('SocketException')) {
        return {'success': false, 'message': 'Cannot connect to server. Check if backend is running.'};
      }
      return {'success': false, 'message': 'Connection error: ${e.toString()}'};
    }
  }

  // Get profile function
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
