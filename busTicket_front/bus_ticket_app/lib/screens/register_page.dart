import 'dart:convert';

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/screens/login_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Future<void> registerUser() async {
    const String url = '$apiUrl/users'; 

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          'name': nameController.text,
          'username': usernameController.text,
          'password': passwordController.text,
          'email': emailController.text,
          'rol':'user'
        })
      );

      if (response.statusCode == 201) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        
      } else {
        
        print('Error en el registro. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      
      print('Error en la solicitud: $error');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                registerUser();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}