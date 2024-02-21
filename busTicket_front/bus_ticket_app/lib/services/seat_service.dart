import 'dart:convert' as convert;

import 'package:bus_ticket_app/config.dart';
import 'package:bus_ticket_app/models/seat.dart';

import 'package:http/http.dart' as http;

class SeatService {
  Future<List<Seat>> getSeatsByTrip(int tripId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/seats/byTrip/$tripId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = convert.jsonDecode(response.body);
      List<Seat> seats = data.map((json) => Seat.fromJson(json)).toList();
      return seats;
    } else {
      throw Exception('Failed to load seats');
    }
  }
}