import 'dart:convert';

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/city_model.dart';

import 'package:http/http.dart' as http;

class CityService {

  //Get all cities
  Future<List<CityModel>> fetchCityList() async {
    final response = await http.get(Uri.parse('$apiUrl/cities'));

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<CityModel> cities = data.map((json) => CityModel.fromJson(json)).toList();
      return cities;
    }else{
      throw Exception('Error loading cities');
    }
  }

  //add city

}