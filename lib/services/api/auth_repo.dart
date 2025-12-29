import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository extends GetxController {
  static const String _baseUrl = 'https://sungod.demospro2023.in.net/api';

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/login');

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );

      log('Login status: ${response.statusCode}');
      log('Login response: ${response.body}');

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = decoded['token'];

        if (token == null) {
          throw Exception('Token missing in response');
        }

        return token;
      } else {
        // API-provided error message
        final message = decoded['message'] ?? 'Login failed';
        throw Exception(message);
      }
    } catch (e) {
      log('HTTP Login Error: $e');
      throw Exception('Unable to login. Please try again.');
    }
  }
}
