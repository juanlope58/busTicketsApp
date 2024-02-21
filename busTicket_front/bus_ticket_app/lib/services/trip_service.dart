import 'dart:convert' as convert;

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/trip.dart';

import 'package:http/http.dart' as http;


class TripService {

  //Get all trips
  Future<List<Trip>> listAll() async {
    final response = await http.get(Uri.parse('$apiUrl/trips'));

    if(response.statusCode == 200){
      List<dynamic> data = convert.jsonDecode(response.body);
      List<Trip> trips = data.map((json) => Trip.fromJson(json)).toList();
      return trips;
    }else{
      throw Exception('Error loading cities');
    }
  }

  //Get filtered Trips
  Future<List<Trip>> getFilteredTrips(int originCityId, int destinationCityId, DateTime date) async {
  
    final formattedDate = '${date.year}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}'; 
    
    final url = Uri.parse('$apiUrl/trips/filtered?originCityId=$originCityId&destinationCityId=$destinationCityId&date=$formattedDate');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = convert.jsonDecode(response.body);
      List<Trip> filteredTrips = data.map((json) => Trip.fromJson(json)).toList();

      return filteredTrips;
    } else {
      throw Exception('Failed to load filtered trips');
    }
}

}