import 'dart:convert';
import 'package:bus_ticket_app/config.dart';
import 'package:http/http.dart' as http;

import 'package:bus_ticket_app/models/user_model.dart';

class UserService {


  //Get all users (only for admins)
  Future<List<UserModel>> fetchUserList() async {
    final response = await http.get(Uri.parse('$apiUrl/user/users'));

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<UserModel> userList = data.map((json) => UserModel.fromJson(json)).toList();
      return userList;
      
    }else{
      throw Exception('Error loading the users list');
    }
  }

  //Register user
  Future<bool> registerUser(Map<String,dynamic> user) async {
    final response = await http.post(Uri.parse(
      '$apiUrl/user/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );
    if(response.statusCode == 201){
      //user registered successfully
      return true;
    }else{
      throw Exception('Error registering user');
    }
  }

}