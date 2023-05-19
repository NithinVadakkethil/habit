import 'package:flutter/material.dart';
import 'package:client/screens/login/login_screen.dart';
import 'package:client/screens/home/home_screen.dart';

class PrivateRoute extends StatelessWidget {
  final bool isAuthenticated;

  const PrivateRoute({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? HomeScreen() : LoginScreen();
  }
}
