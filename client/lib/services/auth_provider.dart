import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String? authToken;
  String? username;

  bool get isAuthenticated => authToken != null;
  String get currentUsername => username ?? 'nithin';

  void login(String username, String password) {
    // Make the API call to authenticate with the server
    // Retrieve the JWT token and set it as the authToken
    // Replace this logic with your actual authentication implementation

    // Simulating a successful login
    authToken = 'your_generated_jwt_token_here';
    this.username = username;
    notifyListeners();
  }

  void logout() {
    // Clear the authToken and username
    authToken = null;
    username = null;
    notifyListeners();
  }
}
