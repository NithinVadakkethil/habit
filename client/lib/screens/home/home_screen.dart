import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/services/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<AuthProvider>(context).currentUsername;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $username!'),
            SizedBox(height: 16.0),
            Text('Home Page'),
          ],
        ),
      ),
    );
  }
}
