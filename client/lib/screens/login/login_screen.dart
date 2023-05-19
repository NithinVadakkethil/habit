import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/services/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                AuthProvider authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                authProvider.login(username, password).then((_) {
                  // If the login is successful, navigate to the home screen
                  Navigator.pushReplacementNamed(context, '/PrivateRoute');
                }).catchError((error) {
                  // Handle login error here (e.g., display an error message)
                  print(error);
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
