import 'dart:convert' as convert;

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/city_model.dart';

import 'package:http/http.dart' as http;

class CityService {

  //Get all cities
  Future<List<CityModel>> fetchCityList() async {
    final response = await http.get(Uri.parse('$apiUrl/city/cities'));

    if(response.statusCode == 200){
      List<dynamic> data = convert.jsonDecode(response.body);
      List<CityModel> cities = data.map((json) => CityModel.fromJson(json)).toList();
      return cities;
    }else{
      throw Exception('Error loading cities');
    }
  }

  //add city
  Future<bool> registerCity(CityModel city) async {
    print('Estoy en registerCity de service');
    try {
      print(convert.jsonEncode(city.toJson()));
      final response = await http.post(
        Uri.parse('$apiUrl/city/register'),
        headers: {'Content-Type':'application/json'},
        body: convert.jsonEncode(city.toJson()),
      );
      if(response.statusCode == 201){
        return true;
      }else{
        print('Error:${response.statusCode}');
        print('Response Body: ${response.body}');
        return false;
      }
      
    } catch (error) {
      print('Exception during registerCity: $error');
      return false;
      
    }
  }

}