import 'package:bus_ticket_app/models/user.dart';
import 'package:bus_ticket_app/screens/home_page.dart';
import 'package:bus_ticket_app/screens/register_page.dart';
import 'package:bus_ticket_app/services/auth_service.dart';
import 'package:bus_ticket_app/utils/custom_snack_bar.dart';
import 'package:bus_ticket_app/utils/user_state.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                
                User? user = await authService.login(
                  usernameController.text,
                  passwordController.text,
                );

                if (user != null) {
                  UserState.setUser(user);
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage(),)
                  );
                } else {
          
                  CustomSnackBar.showError(context, 'Invalid username or password');
                
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // voy a la pagina de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Not registered? Register here'),
            ),
          ],
        ),
      ),
    );
  }
}