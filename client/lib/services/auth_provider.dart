import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  String? authToken;
  String? username;

  bool get isAuthenticated => authToken != null;
  String get currentUsername => username ?? '';

  Future<void> login(String username, String password) async {
    // try {
    //   final response = await http.post(
    //     Uri.parse('http://127.0.0.1:8000/api/token/'),
    //     body: {
    //       'username': 'admin',
    //       'password': 'admin',
    //     },
    //   );

    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');

    //   if (response.statusCode == 200) {
    //     // Successful login
    //     final data = json.decode(response.body);
    //     authToken = data['token'];
    //     this.username = username;
    //     notifyListeners();
    //   } else {
    //     // Error handling for unsuccessful login
    //     // Replace this with your own error handling logic
    //     throw Exception('Login failed');
    //   }
    // } catch (e) {
    //   // Exception handling
    //   // Replace this with your own error handling logic
    //   throw Exception('Login failed: $e');
    // }
    final url = Uri.parse('http://127.0.0.1:8000/api/token/');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': 'admin', 'password': 'admin'});

    try {
      final response = await http.post(url, headers: headers, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Successful login
        final data = json.decode(response.body);
        final authToken = data['token'];

        // Do something with the authToken
      } else {
        // Error handling for unsuccessful login
        // Replace this with your own error handling logic
        throw Exception('Login failed');
      }
    } catch (e) {
      // Exception handling
      // Replace this with your own error handling logic
      throw Exception('Login failed: $e');
    }
  }

  void logout() {
    // Clear the authToken and username
    authToken = null;
    username = null;
    notifyListeners();
  }
}
