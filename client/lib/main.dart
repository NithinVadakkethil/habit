import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/screens/login/login_screen.dart';
import 'package:client/screens/home/home_screen.dart';
import 'package:client/utils/private/private_route.dart';
import 'package:client/services/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated = true; // Replace with your authentication logic

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PrivateRoute(isAuthenticated: isAuthenticated),
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
