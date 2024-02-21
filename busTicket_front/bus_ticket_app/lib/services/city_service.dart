import 'dart:convert' as convert;

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/city.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CityService {

  var logger = Logger();

  //Get all cities
  Future<List<City>> listAll() async {
    final response = await http.get(Uri.parse('$apiUrl/cities'));

    if(response.statusCode == 200){
      List<dynamic> data = convert.jsonDecode(response.body);
      List<City> cities = data.map((json) => City.fromJson(json)).toList();
      return cities;
    }else{
      throw Exception('Error loading cities');
    }
  }

  //add city
  // Future<bool> create(City city) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$apiUrl/cities'),
  //       headers: {'Content-Type':'application/json'},
  //       body: convert.jsonEncode(city.toJson()),
  //     );
  //     if(response.statusCode == 201){
  //       return true;
  //     }else{
  //       logger.i('Te code was NOT CREATE');
  //       return false;
  //     }
      
  //   } catch (error) {
  //       logger.e('Exception during registerCity: $error');
  //     return false;
      
  //   }
  // }

}