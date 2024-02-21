// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  User? _currentUser;

  Future<User?> login(String username, String password) async {

    try {
      final response = await http.post(Uri.parse('$apiUrl/auth'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({'username':username,'password':password}),
        );

        if(response.statusCode == 200){
          
          // final String token = jsonDecode(response.body)['token'];
          // print('$token');

          final Map<String,dynamic> userData = jsonDecode(response.body);
          _currentUser = User.fromJson(userData);
          return _currentUser;
        } else {
          print(response.body);
          print( 'Error during login. check your credentials.');
          return null;
        }

    } catch (e) {

      print('Error during login. Please try again.');
      return null;
      
    }  
  }

  void logout() {
    
    _currentUser = null;
  }

  User? getCurrentUser() {
    return _currentUser;
  }
}